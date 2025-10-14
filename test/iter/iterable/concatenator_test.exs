# SPDX-FileCopyrightText: 2024 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2024 iterex contributors <https://github.com/ash-project/iterex/graphs.contributors>
#
# SPDX-License-Identifier: MIT

defmodule Iter.Iterable.ConcatenatorTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.Concatenator}
  use ExUnit.Case, async: true

  describe "next/1" do
    test "it sequentially concatenates iterables" do
      assert [1, 2, 3, :a, :b, :c, "a", "b", "c"] =
               [[1, 2, 3], [:a, :b, :c], ["a", "b", "c"]]
               |> Concatenator.new()
               |> Iterable.to_list()
    end
  end
end
