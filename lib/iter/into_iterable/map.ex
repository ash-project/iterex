# SPDX-FileCopyrightText: 2024 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2024 iterex contributors <https://github.com/ash-project/iterex/graphs.contributors>
#
# SPDX-License-Identifier: MIT

defimpl Iter.IntoIterable, for: Map do
  @moduledoc false

  @doc false
  def into_iterable(map), do: Iter.Iterable.Map.new(map)
end
