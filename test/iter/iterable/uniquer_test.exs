# SPDX-FileCopyrightText: 2023 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2023 James Harton
# SPDX-FileCopyrightText: 2023 Zach Daniel
#
# SPDX-License-Identifier: MIT

defmodule Iter.Iterable.UniquerTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.Uniquer}
  use ExUnit.Case, async: true

  test "it emits only unique elements" do
    assert [1, 2, 3] =
             [1, 2, 3, 3, 2, 1]
             |> Uniquer.new()
             |> Iterable.to_list()
  end
end
