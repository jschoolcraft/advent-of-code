require "byebug"

module Year2021
  class Day07
    def part1(input)
      positions = input.first.split(/,/).map(&:to_i)
      fuel = nil
      position = nil
      positions.min.upto(positions.max) do |pos|
        f = positions.map { |h| (h - pos).abs }.sum
        if fuel.nil?
          fuel = f
          position = pos
        elsif f < fuel
          fuel = f
          position = pos
        end
      end
      fuel
    end

    def part2(input)
      positions = input.first.split(/,/).map(&:to_i)
      fuel = nil
      position = nil
      positions.min.upto(positions.max) do |pos|
        f = positions
          .map { |h| (h - pos).abs }
          .map { |h| (h * (h + 1)) / 2 }
          .sum
        if fuel.nil?
          fuel = f
          position = pos
        elsif f < fuel
          fuel = f
          position = pos
        end
      end
      fuel
    end
  end
end
