require IEx

Code.load_file("frequency_finder.exs")
ExUnit.start

defmodule FrequencyFinderTest do
  alias FrequencyFinder, as: FF
  use ExUnit.Case, async: true

  test "prompt" do
    IEx.pry
    assert true
  end
end
