defmodule Iter.Iterable.PeekerTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.Empty, Iterable.Peeker}
  use ExUnit.Case, async: true

  describe "next/1" do
    test "when there are no elements in the peek buffer, it just advances and returns the iterable" do
      assert {:ok, :a, [:b, :c]} =
               [:a, :b, :c]
               |> Peeker.new()
               |> Iterable.next()
    end

    test "when there are no elements in the peek buffer _and_ the iterable is empty, it returns done" do
      assert :done =
               []
               |> Peeker.new()
               |> Iterable.next()
    end

    test "when there is one element in the peek buffer it returns the element and the iterable" do
      assert {:ok, :a, [:b, :c]} =
               %Peeker{elements: [:a], iterable: [:b, :c], size: 1}
               |> Iterable.next()
    end

    test "when there is more than one element in the peek buffer it returns the element and reduces the peek buffer" do
      assert {:ok, :a, %Peeker{elements: [:b], iterable: [:c], size: 1}} =
               %Peeker{
                 elements: [:a, :b],
                 iterable: [:c],
                 size: 2
               }
               |> Iterable.next()
    end
  end

  describe "peek/1" do
    test "when there are no elements in the peek buffer but elements in the iterable, it advances the iterable" do
      assert {:ok, :a, %Peeker{elements: [:a], iterable: [:b, :c], size: 1}} =
               %Peeker{elements: [], iterable: [:a, :b, :c], size: 0}
               |> Iterable.peek()
    end

    test "when there are no elements in the peek buffer and no elements in the iterable, it returns done" do
      assert :done =
               %Peeker{elements: [], iterable: [], size: 0}
               |> Iterable.peek()
    end

    test "when there is one element in the peek buffer, it returns the element" do
      peeker = %Peeker{elements: [:a], iterable: [:b, :c], size: 1}
      assert {:ok, :a, ^peeker} = Iterable.peek(peeker)
    end

    test "when there is more than one element in the peek buffer, it returns the first element" do
      peeker = %Peeker{elements: [:a, :b, :c], iterable: [:d], size: 3}
      assert {:ok, :a, ^peeker} = Iterable.peek(peeker)
    end
  end

  describe "peek/2" do
    test "when there are no elements in the peek buffer but elements in the iterable, it advances the iterable" do
      assert {:ok, [:a, :b], 2, %Peeker{elements: [:a, :b], iterable: [:c, :d], size: 2}} =
               Peeker.new([:a, :b, :c, :d])
               |> Iterable.peek(2)
    end

    test "when there are no elements in the peek buffer and no elements in the iterable, it returns done" do
      assert :done =
               Peeker.new([])
               |> Iterable.peek(2)
    end

    test "when there are enough elements in the peek buffer, it returns them" do
      peeker = %Peeker{elements: [:a, :b], iterable: [], size: 2}

      assert {:ok, [:a, :b], 2, ^peeker} =
               peeker
               |> Iterable.peek(2)
    end

    test "when there are more than enough elements in the peek buffer, it returns them" do
      peeker = %Peeker{elements: [:a, :b, :c], iterable: [], size: 3}

      assert {:ok, [:a, :b], 2, ^peeker} =
               peeker
               |> Iterable.peek(2)
    end

    test "when there are not enough elements in the peek buffer, it advances the iterable" do
      assert {:ok, [:a, :b, :c, :d], 4,
              %Peeker{elements: [:a, :b, :c, :d], iterable: [:e], size: 4}} =
               %Peeker{elements: [:a, :b], iterable: [:c, :d, :e], size: 2}
               |> Iterable.peek(4)
    end

    test "when there are not enough elements in the peek buffer or the iterable returns what it can get with an empty iterable" do
      assert {:ok, [:a, :b, :c], 3, %Peeker{elements: [:a, :b, :c], iterable: %Empty{}, size: 3}} =
               %Peeker{elements: [:a], iterable: [:b, :c], size: 1}
               |> Iterable.peek(4)
    end
  end
end
