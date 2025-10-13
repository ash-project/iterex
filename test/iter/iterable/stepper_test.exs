# SPDX-FileCopyrightText: 2023 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2023 James Harton
# SPDX-FileCopyrightText: 2023 Zach Daniel
#
# SPDX-License-Identifier: MIT

defmodule Iter.Iterable.StepperTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.Stepper}
  use ExUnit.Case, async: true

  test "it steps over an iterable" do
    assert [1, 3, 5, 7, 9] =
             1..9
             |> Stepper.new(2)
             |> Iterable.to_list()
  end
end
