require "byebug"

module Year2020
  class Day01
    def part1(input)
      expenses = input.map(&:to_i)

      product = 0
      expenses.each do |expense|
        target = 2020 - expense
        next unless expenses.include?(target)

        product = target * expense
        break
      end
      product
    end

    def part2(input)
      expenses = input.map(&:to_i)

      product = 0
      expenses.each do |expense1|
        remaining_expenses = (expenses - [expense1])

        remaining_expenses.each do |expense2|
          next if expense1 + expense2 > 2020

          target = 2020 - expense1 - expense2
          next unless remaining_expenses.include?(target)

          product = target * expense1 * expense2
          break
        end
      end

      product
    end
  end
end
