# SPDX-FileCopyrightText: 2023 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2023 James Harton
# SPDX-FileCopyrightText: 2023 Zach Daniel
#
# SPDX-License-Identifier: MIT

defimpl Iter.IntoIterable, for: MapSet do
  @moduledoc false

  @doc false
  def into_iterable(set), do: set
end
