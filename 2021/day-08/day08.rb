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

    def find_numbers(input)
      line = input.strip.split(/\s+/).map { |n| n.chars.sort.join }

      one   = line.detect { |s| s.size == 2 }
      four  = line.detect { |s| s.size == 4 }
      seven = line.detect { |s| s.size == 3 }
      eight = line.detect { |s| s.size == 7 }

      two_three_five = line.select { |s| s.size == 5 }
      three = two_three_five.detect do |s|
        s.chars.include?(one.chars.first) && s.chars.include?(one.chars.last)
      end

      five = (two_three_five - [three]).detect do |s|
        (s.chars - four.chars - three.chars).size.zero?
      end

      two = (two_three_five - [three] - [five]).first

      six_nine_zero = line.select { |s| s.size == 6 }
      nine = six_nine_zero.detect do |s|
        (s.chars - four.chars - seven.chars).size == 1
      end

      six = (six_nine_zero - [nine]).detect do |s|
        (s.chars - five.chars).size == 1
      end

      zero = (six_nine_zero - [six] - [nine]).first

      [zero, one, two, three, four, five, six, seven, eight, nine]
    end

    def process_output(input)
      signal, output = input.split(/\|/)
      numbers = find_numbers(signal)
      result = output.strip.split(/\s+/).map! { |o| numbers.index(o.chars.sort.join) }
      result.join.to_i
    end

    def part2(input)
      input.map { |i| process_output(i) }.sum
    end
  end
end
