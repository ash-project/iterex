# SPDX-FileCopyrightText: 2023 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2023 James Harton
# SPDX-FileCopyrightText: 2023 Zach Daniel
#
# SPDX-License-Identifier: MIT

defmodule Iter.ImplTest do
  @moduledoc false
  use ExUnit.Case, async: true
  alias Iter.Impl
  doctest Iter.Impl

  describe "each/2" do
    setup do
      {:ok, pid} = start_supervised({Agent, fn -> [] end})
      {:ok, agent: pid}
    end

    test "it applies the function for every element", %{agent: agent} do
      assert :done =
               [1, 2, 3]
               |> Impl.each(fn element ->
                 Agent.update(agent, &[element | &1])
               end)

      assert Agent.get(agent, &:lists.reverse(&1)) == [1, 2, 3]
    end
  end
end
