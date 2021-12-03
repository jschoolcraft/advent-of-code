require "byebug"

module Year2021
  class Day03
    def part1(input)
      epsilon = []
      gamma = []

      input.map!(&:chars)
      0.upto(input.first.size - 1).each do |bit|
        freq = input.map { |i| i[bit] }.tally
        if freq['0'] > freq['1']
          gamma << '0'
          epsilon << '1'
        else
          gamma << '1'
          epsilon << '0'
        end
      end

      g = gamma.join.to_i(2)
      e = epsilon.join.to_i(2)
      g * e
    end

    def filter(candidates, position, m_or_l, keep)
      return candidates.first if candidates.size == 1

      freq = candidates.map(&:chars).map { |i| i[position] }.tally.to_a.sort { |a,b| a.last <=> b.last }
      new_candidates = if freq.map(&:last).uniq.size == 1
                         # they're the same
                         candidates.select { |c| c.chars[position] == keep }
                       elsif m_or_l == :most
                         candidates.select { |c| c.chars[position] == freq.last.first }
                       else
                         candidates.select { |c| c.chars[position] == freq.first.first }
                       end
      filter(new_candidates, position += 1, m_or_l, keep)
    end

    def part2(input)
      oxy = filter(input, 0, :most, '1')
      co2 = filter(input, 0, :least, '0')

      oxy.to_i(2) * co2.to_i(2)
    end
  end
end
