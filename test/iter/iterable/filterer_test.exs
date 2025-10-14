# SPDX-FileCopyrightText: 2024 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2024 iterex contributors <https://github.com/ash-project/iterex/graphs.contributors>
#
# SPDX-License-Identifier: MIT

defmodule Iter.Iterable.FilterTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.Filterer}
  use ExUnit.Case, async: true

  test "it keeps only matching elements" do
    assert [2, 4] =
             [1, 2, 3, 4]
             |> Filterer.new(&(rem(&1, 2) == 0))
             |> Iterable.to_list()
  end
end
