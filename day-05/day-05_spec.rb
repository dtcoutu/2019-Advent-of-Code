require_relative 'day-05'
require 'minitest/autorun'

class Day05Test < Minitest::Test
  def test_small_example_first_process
    input = '1,9,10,3,2,3,11,0,99,30,40,50'
    expected = '1,9,10,70,2,3,11,0,99,30,40,50'

    day = Day05.new(input)
    day.process(address: 0, opcode: :+)
    actual = day.result

    assert_equal expected, actual
  end

  def test_complete_small_example
    input = '1,9,10,3,2,3,11,0,99,30,40,50'
    expected = '3500,9,10,70,2,3,11,0,99,30,40,50'

    day = Day05.new(input)
    day.complete
    actual = day.result

    assert_equal expected, actual
  end

  def test_one
    input = '1,0,0,0,99'
    expected = '2,0,0,0,99'

    day = Day05.new(input)
    day.complete
    actual = day.result

    assert_equal expected, actual
  end

  def test_two
    input = '2,3,0,3,99'
    expected = '2,3,0,6,99'

    day = Day05.new(input)
    day.complete
    actual = day.result

    assert_equal expected, actual
  end

  def test_three
    input = '1,1,1,4,99,5,6,0,99'
    expected = '30,1,1,4,2,5,6,0,99'

    day = Day05.new(input)
    day.complete
    actual = day.result

    assert_equal expected, actual
  end

  def test_simple_opcode_three
    input = '2,3,0,3,3,2,99'
    expected = '2,3,1,6,3,2,99'

    day = Day05.new(input)
    day.complete
    actual = day.result

    assert_equal expected, actual
  end
end
