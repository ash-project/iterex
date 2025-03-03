defmodule Iter.Ok do
  @moduledoc """
  A version of common iterator operations that operate on results (ie
  `:ok`/`:error` tuples).
  """

  require Iter
  alias Iter.Error.IterExhausted

  @type t :: Iter.t()
  @type predicate :: (any -> :ok | :error | {:ok, any} | {:error, any})
  @type mapper :: (any -> {:ok, any} | {:error, any} | :error)
  @type element :: Iter.element()

  @doc """
  Returns `true` of all elements in the iterator are `:ok` tuples.

  ## Examples

      iex> [{:ok, 1}, {:ok, 2}]
      ...> |> Iter.from()
      ...> |> Iter.Ok.all?()
      true

      iex> [{:ok, 1}, {:error, "error"}]
      ...> |> Iter.from()
      ...> |> Iter.Ok.all?()
      false
  """
  @spec all?(t) :: boolean
  def all?(iter), do: Iter.all?(iter, &ok_result?/1)

  @doc """
  Returns `true` if `fun.(element)` returns an `:ok` tuple.

  Iterates over the iterator and invokes `fun` on each element.  If `fun` ever
  returns a value which is not an `:ok` tuple then iteration stops immediately
  and `false` is returned.  Otherwise `true` is returned.

  ## Examples

      iex> [2, 4, 6]
      ...> |> Iter.from()
      ...> |> Iter.Ok.all?(&{:ok, &1})
      true

  """
  @spec all?(t, predicate) :: boolean
  def all?(iter, predicate) when is_function(predicate, 1) do
    iter
    |> Iter.map(predicate)
    |> Iter.all?(&ok_predicate_result?/1)
  end

  @doc """
  Returns `true` if at least one element in the iterator is an `:ok` tuple.

  When an element is an `:ok` tuple iteration stops immediately and `true` is
  returned. In all other cases `false` is returned.

  ## Examples

      iex> [{:error, nil}, {:ok, 1}]
      ...> |> Iter.from()
      ...> |> Iter.Ok.any?()
      true

  """
  @spec any?(t) :: boolean
  def any?(iter) do
    Iter.any?(iter, &ok_result?/1)
  end

  @doc """
  Returns `true` if `fun.(element)` returns an `:ok` tuple for at least one element in the iterator.

  Consumes the iterator and invokes `fun` on each element. When an invocation of `fun` returns an `:ok` tuple iteration stops immediately and `true` is returned. In all other cases `false` is returned.

  ## Examples

      iex> [{:error, nil}, {:ok, 1}]
      ...> |> Iter.from()
      ...> |> Iter.Ok.any?(&Function.identity/1)
      true
  """
  @spec any?(t, predicate) :: boolean
  def any?(iter, predicate) do
    iter
    |> Iter.map(predicate)
    |> Iter.any?(&ok_predicate_result?/1)
  end

  @doc """
  Remove elements for which `predicate` doesn't return an `:ok` tuple.

  ## Example

      iex> [{:ok, 1}, {:error, 2}, {:ok, 3}]
      ...> |> Iter.from()
      ...> |> Iter.Ok.filter(&Function.identity/1)
      ...> |> Iter.to_list()
      [{:ok, 1}, {:ok, 3}]
  """
  @spec filter(t, predicate) :: t
  def filter(iter, predicate) when is_function(predicate, 1) do
    Iter.filter(iter, fn element ->
      predicate.(element)
      |> ok_predicate_result?()
    end)
  end

  @doc """
  Finds the index of the first value in the iterator for which `predicate` returns an `:ok` tuple.

  ## Example

      iex> [{:error, 1}, {:error, 2}, {:ok, 4}, {:error, 8}]
      ...> |> Iter.from()
      ...> |> Iter.Ok.find_index(&Function.identity/1)
      {:ok, 2, Iter.from([{:error, 8}])}
  """
  @spec find_index(t, predicate) :: {:ok, non_neg_integer(), t} | {:error, IterExhausted.t()}
  def find_index(iter, predicate) when is_function(predicate, 1) do
    iter
    |> Iter.find_index(fn element ->
      predicate.(element)
      |> ok_predicate_result?()
    end)
    |> case do
      {:ok, index, rest} ->
        {:ok, index, rest}

      :done ->
        {:error,
         IterExhausted.exception(
           message: "Reached the end of the iterator without finding a matching element."
         )}
    end
  end

  @doc """
  Similar to `find/3`, but returns the value of the function invocation instead
  of the element itself.

  ## Example

      iex> [2, 3, 4]
      ...> |> Iter.from()
      ...> |> Iter.Ok.find_value(fn x ->
      ...>   if x > 2, do: {:ok, x * x}, else: {:error, :nope}
      ...> end)
      {:ok, 9, Iter.from([4])}

  """
  @spec find_value(t, predicate) :: {:ok, any, t} | {:error, IterExhausted.t()}
  def find_value(iter, fun) do
    iter
    |> Iter.find_value(fn element ->
      case fun.(element) do
        {:ok, value} -> {:ok, value}
        other -> ok_result?(other)
      end
    end)
    |> case do
      {:ok, {:ok, value}, rest} ->
        {:ok, value, rest}

      :done ->
        {:error,
         IterExhausted.exception(
           message: "Reached the end of the iterator without finding a matching element."
         )}
    end
  end

  @doc """
  Searches for the first element in the iterator which matches `predicate`.

  ## Example

      iex> [1, 2, 3, 4, 5]
      ...> |> Iter.from()
      ...> |> Iter.Ok.find(fn x ->
      ...>   if x > 3, do: {:ok, x}, else: :error
      ...> end)
      {:ok, 4, Iter.from([5])}

  """
  @spec find(t, predicate) :: {:ok, element, t} | :done
  def find(iter, predicate) when is_function(predicate, 1) do
    Iter.find(iter, fn element ->
      predicate.(element)
      |> ok_predicate_result?()
    end)
    |> case do
      {:ok, value, rest} ->
        {:ok, value, rest}

      :done ->
        {:error,
         IterExhausted.exception(
           message: "Reached the end of the iterator without finding a matching element."
         )}
    end
  end

  @doc """
  Maps `fun` over the iterator flattening the result.

  Mapping continues as long as `fun` returns an `{:ok, Iter.t}` tuple, otherwise
  it stops early with an error.

  ## Example

      iex> [:a, :b, :c]
      ...> |> Iter.from()
      ...> |> Iter.Ok.flat_map(&{:ok, Iter.from([&1, &1])})
      ...> |> Iter.to_list()
      [:a, :a, :b, :b, :c, :c]
  """
  def flat_map(iter, mapper) when is_function(mapper, 1),
    do: __MODULE__.FlatMapper.new(iter, mapper)

  # Predicates can return either tuples or atoms because they're not picky.
  defp ok_predicate_result?(:ok), do: true
  defp ok_predicate_result?({:ok, _}), do: true
  defp ok_predicate_result?(:error), do: false
  defp ok_predicate_result?({:error, _}), do: false

  defp ok_result?({:ok, _}), do: true
  defp ok_result?({:error, _}), do: false
  defp ok_result?(:error), do: false
end
