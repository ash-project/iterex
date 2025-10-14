# SPDX-FileCopyrightText: 2024 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2024 iterex contributors <https://github.com/ash-project/iterex/graphs.contributors>
#
# SPDX-License-Identifier: MIT

defmodule Iter.Iterable.FlatMapperTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.FlatMapper}
  use ExUnit.Case, async: true

  test "it flats as it maps" do
    assert [1, 2, 3, 6, 7, 8, 10, 11, 12] =
             [1, 6, 10]
             |> FlatMapper.new(&Range.new(&1, &1 + 2))
             |> Iterable.to_list()
  end
end
