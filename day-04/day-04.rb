class Day04

  def self.run
    day = Day04.new('172851-675869')
    day.compute
    puts day.possible_passwords.count
    dayb = Day04.new('172851-675869')
    dayb.compute(2)
    puts dayb.possible_passwords.count
  end

  def initialize(input)
    @input = input
  end

  def compute(repeat_limiter = nil)
    @repeat_limiter = repeat_limiter
    start,finish = input.split('-').map(&:to_i)
    @possible_passwords = (start..finish).to_a.select do |password|
      valid(password)
    end
  end

  def possible_passwords
    @possible_passwords
  end

  private
  attr_reader :input
  attr_reader :repeat_limiter

  def valid(password)
    digits = password.digits

    if (repeat_limiter.nil?)
      digits_never_decrease(digits) && repeat_digits(digits)
    else
      digits_never_decrease(digits) && limit_repeat_digits(digits)
    end
  end

  def digits_never_decrease(digits)
    digits.each_cons(2).all? do |first, second|
      first >= second
    end
  end

  def repeat_digits(digits)
    digits.each_cons(2).any? do |first, second|
      first == second
    end
  end

  def limit_repeat_digits(digits)
    result = digits.chunk(&:itself).any? do |_, chunk|
      chunk.size == repeat_limiter
    end
  end
end
