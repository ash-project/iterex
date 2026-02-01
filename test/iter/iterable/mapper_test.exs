# SPDX-FileCopyrightText: 2024 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2024 iterex contributors <https://github.com/ash-project/iterex/graphs/contributors>
#
# SPDX-License-Identifier: MIT

defmodule Iter.Iterable.MapperTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.Mapper}
  use ExUnit.Case, async: true

  test "it maps over it's elements" do
    assert [2, 4, 6, 8] =
             [1, 2, 3, 4]
             |> Mapper.new(&(&1 * 2))
             |> Iterable.to_list()
  end
end
