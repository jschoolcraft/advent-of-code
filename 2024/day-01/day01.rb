require "byebug"

module Year2024
  class Day01
    def part1(input)
      left, right = parse_input(input)
      left.sort!
      right.sort!

      sum = 0
      0.upto(left.length - 1) do |i|
        # puts format("left (%s) - right (%s) => %s", left[i], right[i], (left[i] - right[i]).abs)
        sum += (left[i] - right[i]).abs
      end
      sum
    end

    def part2(input)
      left, right = parse_input(input)
      left.map { |i| i * right.count(i) }.sum
    end

    def parse_input(input)
      left = []
      right = []

      input.map do |line|
        l,r = line.split(/\s+/).map(&:to_i)
        left << l
        right << r
      end

      [left, right]
    end
  end
end
