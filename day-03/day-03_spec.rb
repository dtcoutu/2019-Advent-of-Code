require_relative 'day-03'
require 'minitest/autorun'

class Day03Test < Minitest::Test
  def test_basic_input
    input = "R8,U5,L5,D3\n"\
            "U7,R6,D4,L4"

    day03 = Day03.new(input)
    actual = day03.compute

    assert_equal [6, 30], actual
  end

  def test_given_example_one
    input = "R75,D30,R83,U83,L12,D49,R71,U7,L72\n"\
            "U62,R66,U55,R34,D71,R55,D58,R83"

    day03 = Day03.new(input)
    actual = day03.compute

    assert_equal [159, 610], actual
  end

  # def test_given_example_two
  # end
end
