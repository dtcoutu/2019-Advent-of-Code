require_relative 'day-06'
require 'minitest/autorun'

class Day06Test < Minitest::Test
  def test_one_level
    input = 'COM)B'
    day = Day06.new(input)
    assert_equal 1, day.compute
  end

  def test_multiple_levels_single_line
    input = "COM)B\nB)C\nC)D"
    day = Day06.new(input)
    assert_equal 6, day.compute
  end

  def test_branching
    input = "COM)B\nB)C\nC)D\nB)E\nE)F"
    day = Day06.new(input)
    assert_equal 11, day.compute
  end

  def test_given_example
    input = "COM)B\nB)C\nC)D\nD)E\nE)F\nB)G\nG)H\nD)I\nE)J\nJ)K\nK)L"
    day = Day06.new(input)
    assert_equal 42, day.compute
  end
end
