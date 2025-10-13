# SPDX-FileCopyrightText: 2023 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2023 James Harton
# SPDX-FileCopyrightText: 2023 Zach Daniel
#
# SPDX-License-Identifier: MIT

defmodule Iter.IntoIterable.File.StreamTest do
  @moduledoc false
  use ExUnit.Case, async: true

  test "it can iterate a file stream identically to enum" do
    enum_stream = File.stream!(__ENV__.file, [:line])
    iter_stream = File.stream!(__ENV__.file, [:line]) |> Iter.IntoIterable.into_iterable()

    assert Enum.to_list(enum_stream) == Iter.Iterable.to_list(iter_stream)
  end
end
