# SPDX-FileCopyrightText: 2023 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2023 James Harton
# SPDX-FileCopyrightText: 2023 Zach Daniel
#
# SPDX-License-Identifier: MIT

defmodule Iter.Iterable.ByChunkerTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.ByChunker, Iterable.Empty}
  use ExUnit.Case, async: true

  describe "next/1" do
    test "it correctly chunks the input" do
      chunker = ByChunker.new([1, 2, 2, 3, 4, 4, 6, 7, 7], &(rem(&1, 2) == 1))

      assert {:ok, [1], chunker} = Iterable.next(chunker)
      assert {:ok, [2, 2], chunker} = Iterable.next(chunker)
      assert {:ok, [3], chunker} = Iterable.next(chunker)
      assert {:ok, [4, 4, 6], chunker} = Iterable.next(chunker)
      assert {:ok, [7, 7], %Empty{}} = Iterable.next(chunker)
    end
  end
end
