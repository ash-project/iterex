# SPDX-FileCopyrightText: 2023 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2023 James Harton
# SPDX-FileCopyrightText: 2023 Zach Daniel
#
# SPDX-License-Identifier: MIT

defmodule Iter.Iterable.EmptyTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.Empty}
  use ExUnit.Case, async: true

  test "it always finishes iteration" do
    assert [] =
             Empty.new()
             |> Iterable.to_list()
  end
end
