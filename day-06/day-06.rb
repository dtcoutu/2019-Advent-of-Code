class Day06

  def self.run
    input_data = File.read('./day-06.txt')
    day = Day06.new(input_data)
    puts day.compute
    puts day.find_orbital_transfers
  end

  def initialize(input)
    @input = input
    @orbits = {}

    input.split("\n").each do |line|
      orbited, orbitor = line.split(")")

      orbits[orbitor] = orbited
    end
  end

  def compute
    walk_orbits
  end

  def find_orbital_transfers
    you = trace_orbit_for('YOU')
    san = trace_orbit_for('SAN')

    shared_orbit = (you & san).first

    you.find_index(shared_orbit) + san.find_index(shared_orbit)
  end

  private
  attr_reader :input
  attr_accessor :orbits

  def walk_orbits
    count = 0

    remaining_orbitors = orbits.keys

    while orbitor = remaining_orbitors.pop
      count += count_orbits_for(orbitor)
    end

    count
  end

  def count_orbits_for(target)
    trace_orbit_for(target).size
  end

  def trace_orbit_for(target)
    orbit_trace = []

    while orbits[target]
      target = orbits[target]
      orbit_trace << target
    end

    orbit_trace
  end
end
