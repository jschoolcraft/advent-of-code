require "byebug"

module Year2021
  class Day06
    # This wasn't my first solution, my first solution just kept
    # building the array and that didn't work for part 2.
    #
    # You can see where I started here:
    # https://github.com/jschoolcraft/advent-of-code/commit/c6d43030f0d5cb353fbc3a420b48b0ab2c4bd89a
    def part1(input, days)
      fish = input.split(/,/).map(&:to_i)

      growth_cycle = {
        0 => 0,
        1 => 0,
        2 => 0,
        3 => 0,
        4 => 0,
        5 => 0,
        6 => 0,
        7 => 0,
        8 => 0,
      }

      fish.each { |f| growth_cycle[f] += 1 }

      0.upto(days - 1).each do |day|
        growth_cycle = {
          0 => growth_cycle[1],
          1 => growth_cycle[2],
          2 => growth_cycle[3],
          3 => growth_cycle[4],
          4 => growth_cycle[5],
          5 => growth_cycle[6],
          6 => growth_cycle[7],
          7 => growth_cycle[8],
          8 => growth_cycle[0],
        }

        growth_cycle[6] += growth_cycle[8]
      end
      growth_cycle.values.sum
    end
  end
end
