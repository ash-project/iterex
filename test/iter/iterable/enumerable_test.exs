# SPDX-FileCopyrightText: 2024 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2024 iterex contributors <https://github.com/ash-project/iterex/graphs/contributors>
#
# SPDX-License-Identifier: MIT

defmodule Iter.Iterable.EnumerableTest do
  @moduledoc false
  use ExUnit.Case, async: true
  alias Iter.Iterable

  test "it can iterate a normal enum" do
    iterable = Iterable.Enumerable.new([1, 2, 3])
    assert [1, 2, 3] = Iterable.to_list(iterable)
  end

  test "it can iterate an infinite stream" do
    stream = Stream.cycle([1, 2, 3])

    assert [1, 2, 3, 1, 2] =
             stream
             |> Iterable.Enumerable.new()
             |> Iterable.take_head(5)
             |> Iterable.to_list()
  end
end
