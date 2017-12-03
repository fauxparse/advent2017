NEIGHBOURS = ((-1..1).to_a.product((-1..1).to_a) - [[0, 0]]).freeze

class Memory
  attr_reader :values, :sums, :first

  def initialize(size: 1_000_000)
    @values = {}
    @sums = {}
    allocate(size)
  end

  def find(target)
    @values.invert[target]
  end

  def distance(target)
    u, v = find(target)
    u.abs + v.abs
  end

  def first_bigger_than(target)
    @sums.values.select { |n| n > target }.sort.first
  end

  private

  def allocate(size)
    x = 0
    y = 0
    direction = 0
    side_length = 1
    side_counter = 0
    @sums[[0, 0]] = 1

    (1..size).each do |i|
      values[[x, y]] = i
      sum_at(x, y)

      case direction
      when 0 then x += 1
      when 1 then y -= 1
      when 2 then x -= 1
      when 3 then y += 1
      end

      side_counter += 1
      if side_counter == side_length
        direction = (direction + 1) % 4
        side_length += 1 if direction.even?
        side_counter = 0
      end
    end
  end

  def sum_at(x, y)
    @sums[[x, y]] ||= NEIGHBOURS.map { |u, v| @sums[[x + u, y + v]] || 0 }.sum
  end
end

m = Memory.new(size: 277678)
puts m.distance(277678)
puts m.first_bigger_than(277678)
