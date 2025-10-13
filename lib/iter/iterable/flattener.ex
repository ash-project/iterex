# SPDX-FileCopyrightText: 2023 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2023 James Harton
# SPDX-FileCopyrightText: 2023 Zach Daniel
#
# SPDX-License-Identifier: MIT

defmodule Iter.Iterable.Flattener do
  defstruct iterable: nil

  @moduledoc """
  An iterable which flattens nested iterables.
  """

  alias Iter.{Impl, IntoIterable, Iterable}

  @type t :: %__MODULE__{iterable: Iterable.t()}

  @doc """
  Creates an iterable which flattens nested iterables.
  """
  @spec new(Iterable.t()) :: t
  def new(iterable), do: %__MODULE__{iterable: iterable}

  defimpl Iterable do
    use Impl

    @doc false
    @impl true
    def next(flatten) do
      with {:ok, element, iterable} <- Iterable.next(flatten.iterable) do
        maybe_wrap(element, %{flatten | iterable: iterable})
      end
    end

    defp maybe_wrap(element, tail) do
      element = IntoIterable.into_iterable(element)
      head = Iterable.Flattener.new(element)
      concat = Iterable.Concatenator.new([head, tail])
      Iterable.next(concat)
    rescue
      Protocol.UndefinedError -> {:ok, element, tail}
    end
  end

  defimpl IntoIterable do
    @doc false
    def into_iterable(self), do: self
  end
end
