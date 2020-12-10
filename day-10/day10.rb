require "byebug"

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end

module Year2020
  class Day10
    def prep_input(input)
      input = input.map(&:to_i).insert(0, 0).sort
      input << input.last + 3
    end

    def part1(input)
      input = prep_input(input)

      ones = 0
      threes = 0
      1.upto(input.size - 1) do |i|
        diff = input[i] - input[i-1]

        if diff == 3
          threes += 1
        elsif diff == 1
          ones += 1
        end
      end

      ones * threes
    end

    def part2(input)
      input = prep_input(input)

      pos = Hash.new(0)
      pos[0] = 1

      input.each do |i|
        3.times do |j|
          pos[i] += pos[i - j -1]
        end
      end
      pos.values.max
    end
  end
end
