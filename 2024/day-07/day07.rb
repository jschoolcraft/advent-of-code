require "byebug"

module Year2024
  class Day07
    def part1(input)
      foo = input.map { |line| parse(line) }
      values = []
      foo.each do |eq|
        values << eq.first if make_true?(eq)
      end
      values.sum
    end

    def parse(line)
      value, eq = line.split(":").map(&:strip)
      value = value.to_i
      eq = eq.split(" ").map(&:strip).map(&:to_i)
      [value, eq]
    end

    def make_true?(equation)
      value, operators = equation

      candidates = []
      candidates << operators.shift

      while operators.length > 0
        a = operators.shift

        candidates = candidates.flat_map do |c|
          [c + a, c * a]
        end.flatten
      end

      candidates.include?(value)
    end

    def part2(input)
      foo = input.map { |line| parse(line) }
      values = []
      foo.each do |eq|
        values << eq.first if make_true2?(eq)
      end
      values.sum
    end

    def make_true2?(equation)
      value, operators = equation

      candidates = []
      candidates << operators.shift

      while operators.length > 0
        a = operators.shift

        candidates = candidates.flat_map do |c|
          [c + a, c * a, (c.to_s + a.to_s).to_i]
        end.flatten
      end

      candidates.include?(value)
    end
  end
end
