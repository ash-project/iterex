# SPDX-FileCopyrightText: 2023 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2023 James Harton
# SPDX-FileCopyrightText: 2023 Zach Daniel
#
# SPDX-License-Identifier: MIT

defimpl Collectable, for: Iter do
  @doc false
  def into(iter), do: {iter, &collector/2}

  defp collector(iter, {:cont, elem}), do: Iter.append(iter, elem)
  defp collector(iter, :done), do: iter
  defp collector(_iter, :halt), do: :ok
end
