require_relative 'day-04'
require 'minitest/autorun'

class Day04Test < Minitest::Test

  def test_chunk
    assert chunking(123345)

    refute chunking(133345)
  end

  def chunking(number)
    number.digits.chunk(&:itself).any? do |_, chunk|
      chunk.size == 2
    end
  end
end
