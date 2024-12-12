require "byebug"

module Year2024
  class Day11
    def part1(input)
      stones = input.split(" ").map(&:to_i)
      25.times do
        stones = blink(stones)
      end
      stones.size
    end

    def blink(stones)
      stones.flat_map do |stone|
        if stone == 0
          1
        elsif stone.to_s.length.even?
          stone.to_s.chars.each_slice((stone.to_s.length/2)).map(&:join).map(&:to_i)
        else
          stone * 2024
        end
      end
    end

    def part2(input)
      4242
    end
  end
end
