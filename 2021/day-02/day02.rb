require "byebug"

module Year2021
  class Day02
    def part1(input)
      h = 0
      d = 0
      input.map(&:split).each do |dir, value|
        value = value.to_i
        case dir
        when "forward"
          h += value
        when "down"
          d += value
        when "up"
          d -= value
        end
        # puts format("h: %i, d: %i", h, d)
      end
      h*d
    end

    def part2(input)
      h = 0
      d = 0
      a = 0
      input.map(&:split).each do |dir, value|
        value = value.to_i
        case dir
        when "forward"
          h += value
          d += a * value
        when "down"
          a += value
        when "up"
          a -= value
        end
        # puts format("h: %i, d: %i", h, d)
      end
      h*d
    end
  end
end
