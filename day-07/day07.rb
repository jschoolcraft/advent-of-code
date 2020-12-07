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

    def find_bags(bags, colors)
      # puts format("colors: %s", colors)
      colors.map do |color|
        if bags[color].keys
          puts format("bags[color]: %s", bags[color])
          bags[color].map do |c, q|
            puts format("q: %s", q)
            q.to_i * find_bags(bags, [c]).sum
          end
        else
          return 1
        end
      end
    end

    def part1(input, color)
      bags = parse_rules(input)
      candidates = find_candidates(bags, [color])
      candidates.flatten.compact.uniq.size
    end

    def part2(input, color)
      bags = parse_rules(input)
      puts bags[color]
      buy = find_bags(bags, [color])
      puts buy.inspect
    end
  end
end
