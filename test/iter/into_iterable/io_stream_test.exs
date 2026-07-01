# SPDX-FileCopyrightText: 2024 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2024 iterex contributors <https://github.com/ash-project/iterex/graphs/contributors>
#
# SPDX-License-Identifier: MIT

defmodule Iter.IntoIterable.IO.StreamTest do
  @moduledoc false
  use ExUnit.Case, async: true

  test "it can iterate an IO stream" do
    words = words()
    {:ok, pid} = StringIO.open(words)

    expected = String.split(words, ~r/(?<=\n)/)

    actual =
      pid
      |> IO.stream(:line)
      |> Iter.IntoIterable.into_iterable()
      |> Iter.Iterable.to_list()

    assert actual == expected
  end

  defp words do
    how_many = 20 + :rand.uniform(20)

    1..how_many
    |> Iter.from()
    |> Iter.map(fn _ -> word() end)
    |> Enum.join("\n")
  end

  defp word do
    length = 3 + :rand.uniform(7)

    1..length
    |> Enum.map(fn _ -> ?a + :rand.uniform(26) - 1 end)
    |> List.to_string()
  end
end
