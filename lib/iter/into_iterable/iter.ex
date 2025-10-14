# SPDX-FileCopyrightText: 2024 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2024 iterex contributors <https://github.com/ash-project/iterex/graphs.contributors>
#
# SPDX-License-Identifier: MIT

defimpl Iter.IntoIterable, for: Iter do
  @moduledoc false
  def into_iterable(iter), do: iter.iterable
end
