require "byebug"

module Year2021
  class Day17
    def print_position(x, y, dx, dy)
      puts format("[%s, %s] v[%s, %s]", x, y, dx, dy)
    end

    def in_target_area?(position, target)
      x_range = Range.new(target.first.first, target.first.last)
      y_range = Range.new(target.last.first, target.last.last)

      x_range.include?(position.first) &&  y_range.include?(position.last)
    end

    def past_target_area?(position, target)
      x_range = Range.new(target.first.first, target.first.last)
      y_range = Range.new(target.last.first, target.last.last)

      position.first > x_range.max || position.last < y_range.min
    end

    def process_shot(velocity, target)
      hit = false

      x = 0
      y = 0
      dx, dy = velocity
      max_x = 0
      max_y = 0

      until past_target_area?([x, y], target) || hit
        x += dx
        y += dy

        unless dx.zero?
          dx = dx.negative? ? dx + 1 : dx - 1
        end
        dy -= 1

        max_x = x if x > max_x
        max_y = y if y > max_y

        # print_position(x, y, dx, dy)
        hit = true if in_target_area?([x, y], target)
      end
      [hit, max_y, velocity]
    end

    def part1(input)
      x_range, y_range = input.last(2)
      x_range = x_range.split(/=/).last.split(/\.+/).map(&:to_i).sort
      y_range = y_range.split(/=/).last.split(/\.+/).map(&:to_i).sort

      max_y = 0
      0.upto(x_range.max) do |dx|
        y_range.min.upto(y_range.min.abs) do |dy|
          hit, y, velocity = process_shot([dx, dy], [x_range, y_range])
          max_y = [max_y, y].max if hit
        end
      end
      max_y
    end

    def part2(input)
      x_range, y_range = input.last(2)
      x_range = x_range.split(/=/).last.split(/\.+/).map(&:to_i).sort
      y_range = y_range.split(/=/).last.split(/\.+/).map(&:to_i).sort

      velocities = []
      0.upto(x_range.max * 3) do |dx|
        y_range.min.upto(y_range.min.abs) do |dy|
          # p [dx, dy]
          hit, y, velocity = process_shot([dx, dy], [x_range, y_range])
          velocities << velocity if hit
        end
      end
      # p velocities
      velocities.size
    end
  end
end
