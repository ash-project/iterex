defmodule Iter.Iterable.MapTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.Map}
  use ExUnit.Case, async: true

  test "it iterates maps in arbitrary order" do
    assert [a: 1, b: 2, c: 3] =
             %{a: 1, b: 2, c: 3}
             |> Map.new()
             |> Iterable.to_list()
             |> Enum.sort()
  end
end
