# SPDX-FileCopyrightText: 2023 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2023 James Harton
# SPDX-FileCopyrightText: 2023 Zach Daniel
#
# SPDX-License-Identifier: MIT

defmodule Iter.CollectableTest do
  @moduledoc false
  use ExUnit.Case, async: true

  test "empty iterators can be collected into" do
    iter = Enum.into(1..6, Iter.empty())

    assert Iter.to_list(iter) == [1, 2, 3, 4, 5, 6]
  end

  test "non-empty iterators can be collected into" do
    iter = Enum.into(10..16, Iter.from(1..6))
    assert Iter.to_list(iter) == [1, 2, 3, 4, 5, 6, 10, 11, 12, 13, 14, 15, 16]
  end
end
