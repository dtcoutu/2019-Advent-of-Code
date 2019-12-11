class Day03
  def self.run
    input_data = File.read('./day-03.txt')
    day03 = Day03.new(input_data)
    puts day03.compute
  end

  def initialize(input)
    @input = input
  end

  def compute
    first_wire_input, second_wire_input = input.split("\n")
    first_wire_points = trace_wire(first_wire_input)
    second_wire_points = trace_wire(second_wire_input)

    intersections = first_wire_points & second_wire_points

    intersections.map { |i| distance_from_origin(i) }.min
  end

  private
    attr_reader :input

    def trace_wire(wire_input)
      current_point = Point.new(0, 0)
      wire_input.split(',').map { |a|
        points = walk_wire(current_point, a)
        current_point = points.last
        points
      }.flatten
    end

    def walk_wire(point, adjustment)
      direction = adjustment[0]
      amount = adjustment[1..-1].to_i

      gen_points(point, direction, amount)
    end

    def gen_points(current_point, direction, amount, acc_points = [])
      return acc_points if amount == 0

      point = next_point(current_point, direction)

      gen_points(point, direction, amount-1, acc_points << point)
    end

    def next_point(point, direction)
      case direction
      when 'R'
        Point.new(point.x+1, point.y)
      when 'L'
        Point.new(point.x-1, point.y)
      when 'U'
        Point.new(point.x, point.y+1)
      when 'D'
        Point.new(point.x, point.y-1)
      end
    end

    def distance_from_origin(point)
      (point.x).abs + (point.y).abs
    end

    class Point
      attr_reader :x, :y
      def initialize(x, y)
        @x = x
        @y = y
      end

      def to_s
        "Point(#{x}, #{y})"
      end

      def eql?(o)
        o.class == self.class && o.state == state
      end

      def hash
        x.hash + y.hash
      end


      protected
      def state
        [x, y]
      end
    end
end

Day03.run
