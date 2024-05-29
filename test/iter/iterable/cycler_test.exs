defmodule Iter.Iterable.CyclerTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.Cycler}
  use ExUnit.Case, async: true

  test "it cycles it's input continually" do
    assert [:a, :b, :c, :a, :b, :c, :a, :b, :c, :a, :b, :c] =
             [:a, :b, :c]
             |> Cycler.new()
             |> Iterable.take_head(12)
             |> Iterable.to_list()
  end
end
