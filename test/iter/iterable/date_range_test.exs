# SPDX-FileCopyrightText: 2024 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2024 iterex contributors <https://github.com/ash-project/iterex/graphs.contributors>
#
# SPDX-License-Identifier: MIT

defmodule Iter.Iterable.Date.RangeTest do
  @moduledoc false
  use ExUnit.Case, async: true
  alias Iter.Iterable

  test "it enumerates the same forwards" do
    first = Date.utc_today()
    last = Date.add(first, days_to_add())
    range = Date.range(first, last)

    assert Enum.to_list(range) == Iterable.to_list(range)
  end

  test "it enumerates the same backwards" do
    first = Date.utc_today()
    last = Date.add(first, 0 - days_to_add())
    range = Date.range(first, last, -1)

    assert Enum.to_list(range) == Iterable.to_list(range)
  end

  defp days_to_add do
    99 + :rand.uniform(99)
  end
end
