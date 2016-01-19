defmodule MovieRecommendationsTest do
  use ExUnit.Case
  import ExUnit.CaptureIO # allow us to capture stuff sent to stdout
  doctest MovieRecommendations
  alias MovieRecommendations, as: MR

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "gets movie recommendations" do
    result = capture_io fn ->
      MR.fetch("Guardians of the Galaxy")
    end
    assert result === """
    Title: Guardians of the Galaxy
    Year: 2014
    Rating: PG-13
    Running Time: 121 minutes
    Description: From Marvel... You should watch this movie right now!
    """
  end
end
