defmodule Iter.Iterable.IntersperserTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.Intersperser}
  use ExUnit.Case, async: true

  test "it intersperserates" do
    assert [1, :wat, 2, :wat, 3] =
             [1, 2, 3]
             |> Intersperser.new(:wat)
             |> Iterable.to_list()
  end
end
