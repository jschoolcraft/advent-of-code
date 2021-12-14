require "byebug"

module Year2021
  class Day14
    def parse_input(input)
      template = input.shift.strip.chars

      rules = {}
      input.reject(&:empty?).each do |rule|
        pair, insert = rule.split(/->/).map(&:strip)
        rules[pair] = insert
      end
      [template, rules]
    end

    def part1(input, steps)
      template, rules = parse_input(input)

      steps.times do
        # p template.join
        insertions = template.each_cons(2).map do |pair|
          rules[pair.join]
        end

        t1 = []
        0.upto(template.size - 1) do |index|
          t1 << template.shift
          t1 << insertions.shift
        end
        template = t1.compact
      end

      mce = template.tally.values.max
      lce = template.tally.values.min

      mce - lce
    end

    def part2(input, steps)
    end
  end
end
