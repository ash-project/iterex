# SPDX-FileCopyrightText: 2024 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2024 iterex contributors <https://github.com/ash-project/iterex/graphs/contributors>
#
# SPDX-License-Identifier: MIT

defmodule Iter.Iterable.DeduperTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.Deduper}
  use ExUnit.Case, async: true

  test "it removes consecutive duplicated elements" do
    assert [1, 2, 3, 2, 1] =
             [1, 2, 3, 3, 2, 1]
             |> Deduper.new()
             |> Iterable.to_list()
  end

  test "it removes consecutive duplicate result elements" do
    assert [{1, :a}, {2, :b}, {1, :a}] =
             [{1, :a}, {2, :b}, {2, :c}, {1, :a}]
             |> Deduper.new(&elem(&1, 0))
             |> Iterable.to_list()
  end
end
