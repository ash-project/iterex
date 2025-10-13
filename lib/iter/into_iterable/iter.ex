# SPDX-FileCopyrightText: 2023 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2023 James Harton
# SPDX-FileCopyrightText: 2023 Zach Daniel
#
# SPDX-License-Identifier: MIT

defimpl Iter.IntoIterable, for: Iter do
  @moduledoc false
  def into_iterable(iter), do: iter.iterable
end
