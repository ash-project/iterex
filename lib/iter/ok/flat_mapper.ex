defmodule Iter.Ok.FlatMapper do
  defstruct iterable: nil, mapper: nil

  @moduledoc """
  An iterable that works like `flat_map/2` except that it only proceeds on ok
  tuples.
  """

  alias Iter.{Impl, IntoIterable, Iterable}

  @type mapper :: (Iterable.element() -> {:ok, Iterable.t()} | {:error, any})
  @type t :: %__MODULE__{iterable: Iterable.t(), mapper: mapper}

  @doc """
  Creates a new iterable which works like `flat_map/2`.
  """
  @spec new(Iterable.t(), mapper) :: t()
  def new(iterable, mapper) when is_function(mapper, 1),
    do: %__MODULE__{iterable: iterable, mapper: mapper}

  defimpl Iterable do
    use Impl

    @doc false
    @impl true
    def next(flat_map) do
      with
  end
end
