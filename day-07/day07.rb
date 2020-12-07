require "byebug"

module Year2020
  class Day07
    def parse_rules(input)
      bags ||= Hash.new { |h,k| h[k] = {} }

      input.each do |rule|
        outer, inner = rule.split(/\sbags contain\s/)
        content_rules = inner.split(/,/).map(&:strip).map { |r| r.match(/^(\d+)\s?(.+)\s?bags?\.?$/)}
        content_rules.each do |cr|
          # puts format("cr: %s", cr.inspect)
          if cr
            bags[outer] = bags[outer].merge(
              cr[2].strip => cr[1].strip
            )
          else
            bags[outer] = {}
          end
        end
      end

      bags
    end

    def find_candidates(bags, colors)
      return unless colors.size > 0

      updated = colors.map do |color|
        bags.select do |k,v|
          v.keys.include? color
        end.keys
      end.flatten
      updated << find_candidates(bags, updated)
    end

    def find_bags(bags, color)
      # puts format("color: %s", color)
      if bags[color].keys.size > 0
        # puts format("bags[color]: %s", bags[color])
        bags[color].map do |c, count|
          # puts format("c: %s, count: %s", c, count)
          # count.to_i * find_bags(bags, c)
          count.to_i + (count.to_i * find_bags(bags, c))
        end.sum
      else
        # puts "returning 1"
        0
      end
    end

    def part1(input, color)
      bags = parse_rules(input)
      candidates = find_candidates(bags, [color])
      candidates.flatten.compact.uniq.size
    end

    def part2(input, color)
      bags = parse_rules(input)
      buy = find_bags(bags, color)
      buy
    end
  end
end
