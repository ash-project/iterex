# SPDX-FileCopyrightText: 2023 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2023 James Harton
# SPDX-FileCopyrightText: 2023 Zach Daniel
#
# SPDX-License-Identifier: MIT

defimpl Iter.IntoIterable, for: Map do
  @moduledoc false

  @doc false
  def into_iterable(map), do: Iter.Iterable.Map.new(map)
end
