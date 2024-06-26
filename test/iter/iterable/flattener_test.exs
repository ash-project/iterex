defmodule Iter.Iterable.FlattenerTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.Flattener}
  use ExUnit.Case, async: true

  test "it flattens it's input" do
    assert [1, 2, 3, 6, 7, 8, 10, 11, 12] =
             [1..3, 6..8, 10..12]
             |> Flattener.new()
             |> Iterable.to_list()
  end
end
