defmodule Iter.Iterable.EmptyTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.Empty}
  use ExUnit.Case, async: true

  test "it always finishes iteration" do
    assert [] =
             Empty.new()
             |> Iterable.to_list()
  end
end
