# SPDX-FileCopyrightText: 2024 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2024 iterex contributors <https://github.com/ash-project/iterex/graphs.contributors>
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
