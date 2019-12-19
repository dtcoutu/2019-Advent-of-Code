class Day05

  def self.run
    input_data = File.read('./day-05.txt')
    # day = Day05.new(input_data)
    # day.complete

    puts "\n part 2"
    day2 = Day05.new(input_data, 5)
    day2.complete
  end

  def initialize(codes, input = 1)
    @codes = codes.split(',').map { |i| i.to_i }
    @input = input

    @current_address = 0
  end

  def complete
    while codes[current_address] != 99 do
      # p "at address: #{current_address} found #{codes[current_address]}"
      modes = modes(current_address)
      opcode = opcode(current_address, modes)
      opcode[:modes] = modes

      # p "opcode: #{opcode}"

      process(current_address, opcode) if opcode[:op]
      @current_address += opcode[:params] if opcode[:params]
    end
  end

  def result
    codes.join(',')
  end

  def process(address, opcode)
    noun = codes[get_ref(address + 1, opcode[:modes][0])]
    verb = codes[get_ref(address + 2, opcode[:modes][1])]

    # p "  #{noun}.send(#{opcode[:op]}, #{verb})"

    r = noun.send(opcode[:op], verb)

    if (r.class == Integer)
      result = r
    else
      result = (r ? 1 : 0)
    end
    ref3 = get_ref(address + 3, opcode[:modes][2])
    # p "    result: #{result}, address: #{address+3}, mode: #{opcode[:modes][2]}, ref: #{ref3}"
    codes[ref3] = result
  end

  private
  attr_reader :codes
  attr_accessor :current_address

  def get_ref(index, mode)
    # p "  mode: #{mode}; index: #{index}"
    mode == 1 ? index : codes[index]
  end

  def opcode(index, modes)
    code = codes[index] % 100
    # p "code: #{code} from value: #{codes[index]} at index: #{index}"

    if code == 1
      { op: :+, params: 4 }
    elsif code == 2
      { op: :*, params: 4 }
    elsif code == 3
      # p "  setting index #{codes[index+1]} to #{@input}"
      codes[codes[index+1]] = @input
      { params: 2 }
    elsif code == 4
      puts codes[codes[index+1]]
      { params: 2 }
    elsif code == 5
      ref1 = get_ref(index+1, modes[0])
      # p "  index: #{index+1}, mode: #{modes[0]}, ref: #{ref1}, result: #{codes[ref1]}"
      if codes[ref1] != 0
        # p "  found !=0 for ref: #{ref1}"
        ref2 = get_ref(index+2, modes[1])
        # p "    index2: #{index+2}, mode2: #{modes[1]}, ref2: #{ref2}, result: #{codes[ref2]}"
        new_address = codes[ref2]
        # p "      set address to #{new_address}"
        @current_address = new_address
        { }
      else
        { params: 3 }
      end
    elsif code == 6
      if codes[get_ref(index+1, modes[0])] == 0
        @current_address = codes[get_ref(index+2, modes[1])]
        { }
      else
        { params: 3 }
      end
    elsif code == 7
      { op: :<, params: 4 }
    elsif code == 8
      { op: :==, params: 4 }
    else
      raise Exception.new "Unable to find opcode for code: #{code}, from index: #{index}, with modes: #{modes}"
    end
  end

  def modes(index)
    modes = (codes[index] / 100).digits

    3.times { modes << 0 }

    # p "index: #{index}; r: #{codes[index]}; modes: #{modes}"
    modes
  end
end
