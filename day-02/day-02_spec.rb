require_relative 'day-02'
require 'minitest/autorun'

class Day02Test < Minitest::Test
  def test_small_example_first_process
    input = '1,9,10,3,2,3,11,0,99,30,40,50'
    expected = '1,9,10,70,2,3,11,0,99,30,40,50'

    day02 = Day02.new(input)
    day02.process(current_block_index: 0)
    actual = day02.result

    assert_equal expected, actual
  end

  def test_complete_small_example
    input = '1,9,10,3,2,3,11,0,99,30,40,50'
    expected = '3500,9,10,70,2,3,11,0,99,30,40,50'

    day02 = Day02.new(input)
    day02.complete
    actual = day02.result

    assert_equal expected, actual
  end

  def test_one
    input = '1,0,0,0,99'
    expected = '2,0,0,0,99'

    day02 = Day02.new(input)
    day02.complete
    actual = day02.result

    assert_equal expected, actual
  end

  def test_two
    input = '2,3,0,3,99'
    expected = '2,3,0,6,99'

    day02 = Day02.new(input)
    day02.complete
    actual = day02.result

    assert_equal expected, actual
  end

  def test_three
    input = '1,1,1,4,99,5,6,0,99'
    expected = '30,1,1,4,2,5,6,0,99'

    day02 = Day02.new(input)
    day02.complete
    actual = day02.result

    assert_equal expected, actual
  end
end
