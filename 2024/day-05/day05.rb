require "byebug"

module Year2024
  class Day05
    def part1(rules, updates)
      middles = []
      rules = rules.map { |rule| rule.split("|").map(&:to_i) }
      # pp rules

      updates.map do |update|
        update = update.split(/,/).map(&:to_i)

        valid = true
        process = update.dup
        while process.length > 1
          candidate = process.shift

          unless process.map { |value| rules.include?([candidate, value])}.all?
            valid = false
            break
          end
        end

        if valid
          middles << update[update.length/2]
        end
      end
      middles.sum
    end

    def part2(rules, updates)
      middles = []
      rejects = []

      rules = rules.map { |rule| rule.split("|").map(&:to_i) }

      updates.map do |update|
        update = update.split(/,/).map(&:to_i)

        valid = true
        process = update.dup
        while process.length > 1
          candidate = process.shift

          unless process.map { |value| rules.include?([candidate, value])}.all?
            valid = false
            rejects << update
            break
          end
        end
      end

      rejects
    end
  end
end
