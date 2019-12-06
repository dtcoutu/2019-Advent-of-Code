class Day02
  attr_reader :input

  def self.run
    input_data = File.read('./day-02.txt')
    day02 = Day02.new(input_data)
    day02.input[1] = 12
    day02.input[2] = 2
    day02.complete
    p day02.input[0]

    100.times do |noun|
      100.times do |verb|
        day02b = Day02.new(input_data)
        day02b.input[1] = noun
        day02b.input[2] = verb
        day02b.complete
        p "specific result: #{(100 * noun + verb)}" if day02b.input[0] == 19690720
      end
    end
  end

  def initialize(input)
    @input = input.split(',').map { |i| i.to_i }
  end

  def complete
    current_address = 0

    while input[current_address] != 99 do
      process(address: current_address)
      current_address += 4
    end
  end

  def process(address:)
    noun = get_parameter(address + 1)
    opcode = opcode(address)
    verb = get_parameter(address + 2)

    result = noun.send(opcode, verb)

    input[input[address + 3]] = result
  end

  def result
    input.join(',')
  end

  private
    def get_parameter(index)
      input[input[index]]
    end

    def opcode(index)
      if input[index] == 1
        :+
      else
        :*
      end
    end
end

Day02.run
