defmodule Iter.Iterable.StepperTest do
  @moduledoc false
  alias Iter.{Iterable, Iterable.Stepper}
  use ExUnit.Case, async: true

  test "it steps over an iterable" do
    assert [1, 3, 5, 7, 9] =
             1..9
             |> Stepper.new(2)
             |> Iterable.to_list()
  end
end
