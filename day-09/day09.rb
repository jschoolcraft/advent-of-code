require "byebug"

module Year2020
  class Day09
    def valid?(preamble, candidate)
      preamble.select { |c| preamble.include?(candidate - c) && candidate - c != c}.any?
    end

    def part1(input, preamble)
      input.map!(&:to_i)
      # puts input.inspect
      preamble.upto(input.size - 1) do |i|
        # puts format("from: %s to %s", i - preamble, i)
        # puts input[i - preamble, preamble + 1]
        chunk = input[i - preamble, preamble + 1]
        candidate = chunk.pop
        # puts format("preamble: %s, candidate: %s", chunk.inspect, candidate.inspect)
        next if valid?(chunk, candidate)

        return candidate
      end
    end

    def part2(input, candidate)
      input.map!(&:to_i)
      limit = input.index(candidate) - 1
      candidates = input[0,limit]

      # puts input.inspect
      # puts candidates.inspect

      upper = 0
      lower = 0
      0.upto(limit - 1) do |i|
        # puts format("i: %s, value: %s", i, candidates[i])
        1.upto(limit - i) do |j|
          potential = candidates[i, j].sort
          # puts format("checking: %s has sum: %s", potential, potential.sum)
          next unless potential.sum == candidate

          upper = potential.last
          lower = potential.first
        end
      end
      upper + lower
    end
  end
end
