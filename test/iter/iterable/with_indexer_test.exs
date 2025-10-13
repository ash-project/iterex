# SPDX-FileCopyrightText: 2023 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2023 James Harton
# SPDX-FileCopyrightText: 2023 Zach Daniel
#
# SPDX-License-Identifier: MIT

defmodule Iter.Iterable.WithIndexerTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.WithIndexer}
  use ExUnit.Case, async: true

  test "it adds an index to each element" do
    assert [{:a, 0}, {:b, 1}, {:c, 2}] =
             [:a, :b, :c]
             |> WithIndexer.new()
             |> Iterable.to_list()
  end
end
