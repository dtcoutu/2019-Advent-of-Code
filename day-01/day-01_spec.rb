require_relative 'day-01'
require 'minitest/autorun'

class Day01Test < Minitest::Test
  def test_module_fuel_calculation
    assert calculate_fuel(12) == 2
    assert calculate_fuel(14) == 2
    assert calculate_fuel(1969) == 654
    assert calculate_fuel(100756) == 33583
  end

  def test_should_never_return_less_than_zero
    assert_equal 0, calculate_fuel(2)
  end

  def test_module_fuel_requirement
    assert_equal 50346, module_fuel_requirement(100756)
  end
end
