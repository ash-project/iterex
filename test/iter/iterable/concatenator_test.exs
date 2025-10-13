# SPDX-FileCopyrightText: 2023 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2023 James Harton
# SPDX-FileCopyrightText: 2023 Zach Daniel
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
