require "byebug"

module Year2021
  class Day01
    def part1(input)
      input.map!(&:to_i)

      inc = 0

      previous = input.shift
      input.each do |depth|
        inc += 1 if depth > previous

        previous = depth
      end
      inc
      # An alternate one line implementation
      # input.map(&:to_i).each_cons(2).select { |e| e.last > e.first }.size
    end

    def part2(input)
      input.map!(&:to_i)
      windows = []

      0.upto(input.size - 3).each do |i|
        windows << input[i..i+2].sum
      end

      inc = 0

      previous = windows.shift
      windows.each do |depth|
        inc += 1 if depth > previous

        previous = depth
      end
      inc
    end
  end
end
