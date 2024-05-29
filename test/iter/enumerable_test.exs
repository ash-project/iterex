defmodule Iter.EnumerableTest do
  @moduledoc false
  use ExUnit.Case, async: true

  test "it implements the `count/1` callback" do
    assert {:ok, 6} ==
             1..6
             |> Iter.from()
             |> Enumerable.count()
  end

  test "it implements the `member?/2` callback" do
    assert {:ok, true} =
             1..5
             |> Iter.from()
             |> Enumerable.member?(3)

    assert {:ok, false} =
             1..5
             |> Iter.from()
             |> Enumerable.member?(30)
  end

  test "it implements the `reduce/3` callback" do
    assert 15 =
             1..5
             |> Iter.from()
             |> Enum.reduce(&(&1 + &2))
  end

  test "it does not implement the `slice/1` callback (should it?)" do
    assert {:error, Enumerable.Iter} = Enumerable.slice(Iter.from(1..5))
  end
end
