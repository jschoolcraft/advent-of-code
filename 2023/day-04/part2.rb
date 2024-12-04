require "byebug"

module Year2023
  class Day04
    def part2(input)
      h = {}

      input.each do |line|
        card, rest = line.split(":")
        mine, winning = rest.split(/\|/).map(&:strip).map { |s| s.scan(/\d+/).map(&:to_i) }
        h[card.scan(/\d+/).map(&:to_i).first] = {
          mine:,
          winning:,
        }
      end

      cards = h.keys
      total_cards = 0
      cards.each do |card|
        card
        total_cards += 1
        next_card = card + 1
        h[card][:winning].each do |winning|
          if h[card][:mine].include?(winning)
            cards.push(next_card)
            next_card += 1
          end
        end
      end
      total_cards
    end
  end
end
