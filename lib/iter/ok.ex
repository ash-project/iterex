defmodule Iter.Ok do
  @moduledoc """
  A version of common iterator operations that operate on results (ie
  `:ok`/`:error` tuples).
  """

  require Iter

  @type t :: Iter.t()
  @type predicate :: (any -> {:ok | :error, any})

  @doc """
  Returns `true` of all elements in the iterator are `:ok` tuples.

  ## Examples

      iex> [{:ok, 1}, {:ok, 2}]
      ...> |> Iter.from()
      ...> |> Iter.Ok.all?()
      true

      iex> [{:ok, 1}, {:error, "argument error}]
      ...> |> Iter.from()
      ...> |> Iter.Ok.all?()
      false
  """
  @spec all?(t) :: boolean
  def all?(iter), do: Iter.all?(iter, &(elem(&1, 0) == :ok))

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
    Iter.all?(iter, fn element ->
      case predicate.(element) do
        {:ok, _} -> true
        _ -> false
      end
    end)
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
    Iter.any?(iter, &(elem(&1, 0) == :ok))
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
    Iter.any?(iter, fn element ->
      case predicate.(element) do
        {:ok, _} -> true
        _ -> false
      end
    end)
  end
end
