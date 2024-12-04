require "byebug"

module Year2023
  class Day04
    def parse_line(line)
      # Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
      card, rest = line.split(/:/)
      my_string, winning_string = rest.split(/\|/)
      my_numbers, winning_numbers = rest.split(/\|/).map { |s| s.scan(/\d+/).map(&:to_i) }
      [card, my_numbers, winning_numbers]
    end

    def find_winning_numbers(card:, mine:, winning:)
      mine & winning
    end

    def score_card(winners)
      return 0 if winners.empty?

      2.pow(winners.size - 1)
    end

    def part1(input)
      scores = input.map do |line|
        card, mine, winning = parse_line(line)
        winners = find_winning_numbers(card:, mine:, winning:)
        score_card(winners)
      end
      scores.sum
    end

    def part2(input)
      4242
    end
  end
end

