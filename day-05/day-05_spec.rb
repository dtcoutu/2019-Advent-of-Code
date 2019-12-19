require_relative 'day-05'
require 'minitest/autorun'

class Day05Test < Minitest::Test
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

  def test_opcode_eight
    input = '8,10,10,1,99'
    expected = '8,1,10,1,99'

    day = Day05.new(input)
    day.complete
    actual = day.result

    assert_equal expected, actual
  end

  def test_larger_example
    input = '3,21,1008,21,8,20,1005,20,22,107,'\
    '8,21,20,1006,20,31,1106,0,36,98,'\
    '0,0,1002,21,125,20,4,20,1105,1,'\
    '46,104,999,1105,1,46,1101,1000,1,20,'\
    '4,20,1105,1,46,98,99'

    day = Day05.new(input, 8)
    day.complete
  end
end
