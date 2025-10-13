# SPDX-FileCopyrightText: 2023 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2023 James Harton
# SPDX-FileCopyrightText: 2023 Zach Daniel
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

    words =
      1..how_many
      |> Iter.from()
      |> Iter.map(fn _ -> Faker.Lorem.word() end)
      |> Enum.join("\n")

    words
  end
end
