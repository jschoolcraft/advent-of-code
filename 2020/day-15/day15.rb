require "byebug"

module Year2020
  class Day15
    def part1(input, limit)
      spoken = []
      spoken += input

      # puts
      spoken.size.upto(limit - 1) do |i|
        turn = i + 1
        last = spoken.last
        # puts format("Turn %s: last spoken: %s", turn, last)
        if spoken.select { |j| j == last }.size == 1
          # puts format("Turn %s: first time spoken, adding 0", turn)
          spoken << 0
        else
          candidates = spoken[0,spoken.size - 1]
          previous = candidates.rindex(last) + 1
          age = turn - 1 - previous
          # puts format("Turn %s: ", turn)
          # puts format("spoken before, candidates: %s, previous_turn: %s, current_turn: %s age: %s", candidates, previous, i, age)
          spoken << age
        end
        # puts format("Turn %s results: spoken: %s, size: %s", turn, spoken.inspect, spoken.size)
      end

      # puts format("spoken: %s, size: %s", spoken.inspect, spoken.size)
      spoken.last
    end

    def part2(input)
      4242
    end
  end
end
