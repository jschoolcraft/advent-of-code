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

    def print_pairs(label, pairs)
      puts label
      p pairs.reject { |k,v| v.zero? }
    end

    def part1(input, steps)
      template, rules = parse_input(input)

      pairs = { }
      rules.keys.each do |rule|
        pairs[rule.chars] = 0
      end

      template.each_cons(2) do |pair|
        pairs[pair] += 1
      end

      steps.times do |step|
        puts
        puts "Step: #{step}"
        new_pairs = Hash.new { |h, k| h[k] = 0 }

        pairs.reject { |_, v| v.zero? }.each do |pair, count|
          insert = rules[pair.join]
          # byebug
          new_pairs[pair] -= 1
          new_pairs[[pair.first, insert]] += 1
          new_pairs[[insert, pair.last]] += 1
        end

        puts "After Insert"
        print_pairs("Pairs", pairs)
        print_pairs("New Pairs", new_pairs)

        new_pairs.each do |pair, count|
          pairs[pair] += count
        end
        puts "After updates"
        print_pairs("Pairs", pairs)
        puts
      end

      chars = Hash.new { |h, k| h[k] = 0 }
      pairs.each do |pair, count|
        chars[pair.first] += count
        chars[pair.last] += count
      end

      p chars
      mce = chars.values.max
      lce = chars.values.min

      mce - lce
    end

    def part2(input, steps)
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
  end
end
