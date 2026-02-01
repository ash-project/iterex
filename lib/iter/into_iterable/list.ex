# SPDX-FileCopyrightText: 2024 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2024 iterex contributors <https://github.com/ash-project/iterex/graphs/contributors>
#
# SPDX-License-Identifier: MIT

defimpl Iter.IntoIterable, for: List do
  @moduledoc false

  @doc false
  def into_iterable(list), do: list
end
