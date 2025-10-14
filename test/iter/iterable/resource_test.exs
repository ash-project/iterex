# SPDX-FileCopyrightText: 2024 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2024 iterex contributors <https://github.com/ash-project/iterex/graphs.contributors>
#
# SPDX-License-Identifier: MIT

defmodule Iter.Iterable.ResourceTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.Resource}
  use ExUnit.Case, async: true

  test "it can make a stream-like resource" do
    assert [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] =
             Resource.new(
               fn -> 0 end,
               fn
                 acc when acc < 10 -> {[acc], acc + 1}
                 acc -> {:halt, acc}
               end,
               fn _acc -> :ok end
             )
             |> Iterable.to_list()
  end
end
