defmodule Iter.Iterable.MapperTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.Mapper}
  use ExUnit.Case, async: true

  test "it maps over it's elements" do
    assert [2, 4, 6, 8] =
             [1, 2, 3, 4]
             |> Mapper.new(&(&1 * 2))
             |> Iterable.to_list()
  end
end
