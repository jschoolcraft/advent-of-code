require "byebug"

module Year2021
  class Day06
    def part1(input, days)
      fish = input.split(/,/).map(&:to_i)

      0.upto(days - 1).each do |day|
        new_fish = 0

        fish = fish.map { |f| f - 1 }

        fish = fish.map do |f|
          if f < 0
            new_fish += 1
            6
          else
            f
          end
        end

        new_fish.times { fish << 8 }
        # puts format("After %2d days: %s", day + 1, fish)
      end
      fish.size
    end

    def part2(input)
      4242
    end
  end
end
