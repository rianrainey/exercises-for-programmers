require IEx

defmodule FrequencyTest do
  use ExUnit.Case
  import ExUnit.CaptureIO # allow us to capture stuff sent to stdout
  doctest Frequency
  alias Frequency, as: F

  test "#count" do
    text = "one two two three three three"
    text_with_whitespace = "   one two two three three three   "
    result = %{"one" => 1, "two" => 2, "three" => 3}
    assert F.count(text) == result
    assert F.count(text_with_whitespace) == result
  end

  #test "pretty_print" do
    #word_count_map = %{"one" => 1, "two" => 2, "three" => 3}
    #result = capture_io fn ->
      #F.pretty_print(word_count_map)
    #end
    #assert result == """
    #three: ***
    #two:   **
    #one:   *
    #"""
  #end

  test "#max_width_of" do
    words = ~w(cat bird bunny dog)
    assert F.max_width_of(words) == 5
  end
end
