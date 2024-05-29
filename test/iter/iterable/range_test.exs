defmodule Iter.Iterable.RangeTest do
  @moduledoc false
  use ExUnit.Case, async: true

  describe "member?/2" do
    test "when the element isn't within the range" do
      refute Iter.Iterable.Range.member?(1..3, 4)
    end

    test "when the range has a step of 1 and the element equals the first value" do
      assert Iter.Iterable.Range.member?(1..3, 1)
    end

    test "when the range has a step of 1 and the element equals the last value" do
      assert Iter.Iterable.Range.member?(1..3, 3)
    end

    test "when the range has a step of 1 and the element is contained in the range" do
      assert Iter.Iterable.Range.member?(1..3, 2)
    end

    test "when the range has a step greater than one and the element equals the first value" do
      assert Iter.Iterable.Range.member?(1..3//2, 1)
    end

    test "when the range has a step greater than one and the element isn't on step" do
      refute Iter.Iterable.Range.member?(1..3//2, 2)
    end

    test "when the range has a step greater than one and the element is in step" do
      assert Iter.Iterable.Range.member?(1..5//2, 3)
    end

    test "when the range has a step greater than one and the element is the last _and_ the last isn't on step" do
      refute Iter.Iterable.Range.member?(1..4//2, 4)
    end

    test "when the range has a step greater than one and the element is the last _and_ the last is on step" do
      assert Iter.Iterable.Range.member?(1..5//2, 5)
    end
  end
end
