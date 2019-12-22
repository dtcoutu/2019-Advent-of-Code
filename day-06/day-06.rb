class Day06

  def self.run
    input_data = File.read('./day-06.txt')
    day = Day06.new(input_data)
    puts day.compute
  end

  def initialize(input)
    @input = input
    @orbits = {}
  end

  def compute
    input.split("\n").each do |line|
      orbited, orbitor = line.split(")")

      orbits[orbitor] = orbited
    end

    walk_orbits
  end

  private
  attr_reader :input
  attr_accessor :orbits

  def walk_orbits
    count = 0

    remaining_orbitors = orbits.keys

    while orbitor = remaining_orbitors.pop
      next_orbitor = orbits[orbitor]

      if next_orbitor
        remaining_orbitors.push(next_orbitor)

        count += 1
      end
    end

    count
  end

end
