require "byebug"

module Year2021
  class Day08
    def part1(input)
      input.map { |line| line.split(/\|/).last.strip }
        .join(" ")
        .split(/\s+/)
        .select { |output| [2, 4, 3, 7].include? output.size }
        .size
    end

    def part2(input)
      4242
    end
  end
end
