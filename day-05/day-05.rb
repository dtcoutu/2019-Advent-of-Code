class Day05

  def self.run
    input_data = File.read('./day-05.txt')
    day = Day05.new(input_data)
    puts day.complete
  end

  def initialize(input)
    @codes = input.split(',').map { |i| i.to_i }
    @input = 1
  end

  def complete
    current_address = 0

    while codes[current_address] != 99 do
      opcode = opcode(current_address)

      if (opcode.class == Symbol)
        process(address: current_address, opcode: opcode)
        current_address += 4
      else
        current_address += 2
      end
    end
  end

  def process(address:, opcode:)
    modes = modes(address)
    noun = codes[get_ref(address + 1, modes[0])]
    verb = codes[get_ref(address + 2, modes[1])]

    result = noun.send(opcode, verb)
    codes[get_ref(address + 3, modes[2])] = result
  end

  private
  attr_reader :codes

  def get_ref(index, mode)
    mode == 1 ? index : codes[index]
  end

  def opcode(index)
    code = codes[index] % 100
    if code == 1
      :+
    elsif code == 2
      :*
    elsif code == 3
      codes[codes[index+1]] = @input
    elsif code == 4
      puts codes[codes[index+1]]
    end
  end

  def modes(index)
    modes = codes[index] / 100

    3.times { modes << 0 }

    modes
  end
end
