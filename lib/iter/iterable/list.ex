# SPDX-FileCopyrightText: 2023 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2023 James Harton
# SPDX-FileCopyrightText: 2023 Zach Daniel
#
# SPDX-License-Identifier: MIT

defimpl Iter.Iterable, for: List do
  @moduledoc false

  use Iter.Impl

  @doc false
  @impl true
  def next([head | tail]), do: {:ok, head, tail}
  def next([]), do: :done

  @doc false
  @impl true
  def peek([]), do: :done
  def peek([head | _] = list), do: {:ok, head, list}

  @doc false
  @impl true
  def count(list), do: length(list)

  @doc false
  def empty?([]), do: true
  def empty?(_), do: false
end
