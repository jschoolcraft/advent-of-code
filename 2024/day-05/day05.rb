require "byebug"

module Year2024
  class Day05
    def part1(rules, updates)
      middles = []
      rules = rules.map { |rule| rule.split("|").map(&:to_i) }
      # pp rules

      updates.map do |update|
        update = update.split(/,/).map(&:to_i)

        if valid?(rules, update)
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

        if !valid?(rules, update)
          rejects << update
        end
      end

      # pp rejects

      rejects.each do |update|
        ordered = []

        while update.length > 1
          # puts "-----"
          # puts format("Ordered: %s", ordered.inspect)
          # puts format("Update: %s", update.inspect)

          first = update.select do |value|
            check = update.reject { |f| f == value }.zip(Array.new(update.length - 1, value))
            # puts format("Value: %s, Check: %s", value, check.inspect)
            check.select { |rule| rules.include?(rule) }.none?
          end.first

          # puts "First: #{first}"
          ordered << update.delete(first)
          # pp ordered
        end

        ordered << update.shift

        # puts "---- Final ----"
        # puts format("Ordered: %s", ordered.inspect)
        # puts format("Update: %s", update.inspect)

        middles << ordered[ordered.length/2]
      end
      middles.sum
    end

    def valid?(rules, update)
      valid = true
      update.each_with_index do |value, index|
        check = update[index..].zip(Array.new(update.length - index + 1, value))
        check.reject! { |f,l| f == l }

        broken_rules = check.select { |rule| rules.include?(rule) }
        if broken_rules.any?
          valid = false

          # puts "*" * 80
          # puts "Broken rules: #{value} - #{broken_rules}"
          # pp update
          # puts "*" * 80
        end

        # rules.include?([update.first, value])
      end
      valid
    end
  end
end
