require "byebug"

module Year2023
  class Day07
    HAND_TYPES = [:five, :four, :full, :three, :two, :one, :high]

    def rank_hands(hands: [])
      return [] if hands.empty?
      return Array(hands.last.last) if hands.size == 1

      sorted = hands.sort_by { |h| h.first }
      sorted.map(&:last)
    end

    def process_line(hand:, bid:)
      matches = hand.chars.tally.values
      type = if matches.include?(5)
               :five
             elsif matches.include?(4)
               :four
             elsif matches.include?(3) && matches.include?(2)
               :full
             elsif matches.include?(3)
               :three
             elsif matches.select { |m| m == 2 }.size == 2
               :two
             elsif matches.include?(2)
               :one
             elsif matches.select { |m| m == 1 }.size == 5
               :high
             else
               raise "Something weird going on"
             end

      {
        hand:,
        bid:,
        type:
      }
    end

    def part1(input)
      hands = []

      input.map do |line|
        hand, bid = line.split(/\s+/)
        bid = bid.to_i

        # Remap the rankings so alphabetical sort "just works"
        # ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]
        # ["2", "3", "4", "5", "6", "7", "8", "9", "C", "D", "E", "F", "G"]
        hand = hand.gsub(/T/, "C").gsub(/J/, "D").gsub(/Q/, "E").gsub(/K/, "F").gsub(/A/, "G")

        hands << process_line(hand:, bid:)
      end

      ranked_bids = []

      HAND_TYPES.reverse.each do |type|
        selected_hands = hands.select { |h| h[:type] == type }.map { |h| [h[:hand], h[:bid]] }

        next if selected_hands.empty?

        ranked_bids += rank_hands(hands: selected_hands)
      end

      scores = []
      ranked_bids.each_with_index do |bid, index|
        scores << bid * (index + 1)
      end

      raise "WTF" if scores.size != input.size

      scores.sum
    end

    def part2(input)
      4242
    end
  end
end
