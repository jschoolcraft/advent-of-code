require "byebug"

module Year2023
  class Day07
    HAND_TYPES = [:five, :four, :full, :three, :two, :one, :high]

    RANKINGS = %w[A K Q T 9 8 7 6 5 4 3 2 J]

    def rank_hands(hands: [])
      return [] if hands.empty?
      return Array(hands.last.last) if hands.size == 1

      sorted = hands.sort_by { |h| h.first }
      puts "Sorted hands:"
      p sorted
      sorted.map(&:last)
    end

    def optimize_hand(hand:)
      return hand unless hand.chars.include?("J")

      matches = hand.chars.tally
      max = matches.values.max

      target = matches.select { |a,b| b == max }.keys.sort_by { |a| RANKINGS.index(a) }.first
      hand.gsub(/J/, target)
    end

    def process_line(hand:, bid:)
      optimized_hand = optimize_hand(hand: hand)
      hand = hand.gsub(/T/, "C").gsub(/J/, "1").gsub(/Q/, "E").gsub(/K/, "F").gsub(/A/, "G")

      matches = optimized_hand.chars.tally.values
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
        optimized_hand:,
        hand:,
        bid:,
        type:
      }
    end

    def part2(input)
      hands = []

      input.map do |line|
        hand, bid = line.split(/\s+/)
        bid = bid.to_i

        hands << process_line(hand:, bid:)
      end

      ranked_bids = []

      HAND_TYPES.reverse.each do |type|
        selected_hands = hands.select { |h| h[:type] == type }.map { |h| [h[:hand], h[:bid]] }

        puts format("Type: %s", type)
        next if selected_hands.empty?

        puts "Selected hands:"
        p selected_hands
        puts "Ranked bids:"
        p rank_hands(hands: selected_hands)
        p

        ranked_bids += rank_hands(hands: selected_hands)
      end

      scores = []
      puts "Ranked bids:"
      p ranked_bids
      raise "foo" if ranked_bids.size != input.size
      raise "foo" if ranked_bids.size != ranked_bids.uniq.size
      ranked_bids.each_with_index do |bid, index|
        scores << bid * (index + 1)
      end

      raise "WTF" if scores.size != input.size

      scores.sum
    end
  end
end
