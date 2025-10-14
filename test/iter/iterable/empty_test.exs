# SPDX-FileCopyrightText: 2024 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2024 iterex contributors <https://github.com/ash-project/iterex/graphs.contributors>
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
