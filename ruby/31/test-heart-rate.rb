require_relative 'heart-rate'
require 'minitest/autorun'

class TestKarvonenHeartRate < Minitest::Test
  def setup
    resting_heart_rate = 65
    age                = 22
    @heart_rate = HeartRate.new(
      resting_heart_rate: resting_heart_rate,
      age: age
    )
  end

  def test_karvonen_heart_rate
    assert_equal @heart_rate.karvonen_heart_rate(100), 198
  end
end
