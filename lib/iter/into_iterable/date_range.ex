# SPDX-FileCopyrightText: 2023 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2023 James Harton
# SPDX-FileCopyrightText: 2023 Zach Daniel
#
# SPDX-License-Identifier: MIT

defimpl Iter.IntoIterable, for: Date.Range do
  @moduledoc false

  @doc false
  def into_iterable(date_range), do: date_range
end
