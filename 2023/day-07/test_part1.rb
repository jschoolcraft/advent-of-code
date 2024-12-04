require "minitest/autorun"
require "./part1"

class TestDay07 < Minitest::Test
  def setup
    @solution = Year2023::Day07.new
  end

  def test_rank_hands
    # assert_equal [], @solution.rank_hands(hands: [])
    # assert_equal [28], @solution.rank_hands(hands: [["KK677", 28]])

    # # KTJJT is weaker than KK677 so return 220, 28
    # # KK677 and KTJJT are both two pair. KTJJT gets rank 2 and KK677 gets rank 3.
    # assert_equal [28, 220], @solution.rank_hands(hands: [["KK677", 28], ["KTJJT", 220]])
    # assert_equal [28, 220], @solution.rank_hands(hands: [["KTJJT", 220], ["KK677", 28]])

    # # T55J5 is weaker than QQQJA so return 684, 483
    # assert_equal [483, 684], @solution.rank_hands(hands: [["T55J5", 684], ["QQQJA", 483]])
    # assert_equal [483, 684], @solution.rank_hands(hands: [["QQQJA", 483], ["T55J5", 684]])

    # # 33332 and 2AAAA are both four of a kind hands, but 33332 is stronger because its first card is stronger
    # assert_equal [1, 2], @solution.rank_hands(hands: [["2AAAA", 1], ["33332", 2]])
    # assert_equal [1, 2], @solution.rank_hands(hands: [["33332", 2], ["2AAAA", 1]])

    # # Try 3 four of a kinds
    # assert_equal [1, 2, 3], @solution.rank_hands(hands: [["2AAAA", 1], ["33332", 2], ["44423", 3]])
    # assert_equal [1, 2, 3], @solution.rank_hands(hands: [["44423", 3], ["33332", 2], ["2AAAA", 1]])
    # assert_equal [1, 2, 3], @solution.rank_hands(hands: [["33332", 2], ["44423", 3], ["2AAAA", 1]])

    # # 77888 and 77788 are both a full house, but 77888 is stronger because its third card is stronger
    # assert_equal [1, 2], @solution.rank_hands(hands: [["77788", 1], ["77888", 2]])
    # assert_equal [1, 2], @solution.rank_hands(hands: [["77888", 2], ["77788", 1]])

    # # Weakest to strongest is "Q3333", "QQQ7Q","QQQQT", "QKQQQ"
    #                         ["E3333", "EEE7E", "EEEEC", "EFEEE"]
    # assert_equal [1,2,3,4], @solution.rank_hands(hands: [["EFEEE", 4], ["E3333", 1], ["EEEET", 3], [ "EEE7E", 2]])
  end

  def test_process_hands
    assert_equal :five, @solution.process_line(hand: "KKKKK", bid: 0)[:type]
    assert_equal :four, @solution.process_line(hand: "KKKK6", bid: 0)[:type]
    assert_equal :full, @solution.process_line(hand: "K8KK8", bid: 0)[:type]
    assert_equal :three, @solution.process_line(hand: "K8KK6", bid: 0)[:type]
    assert_equal :two, @solution.process_line(hand: "K8KT8", bid: 0)[:type]
    assert_equal :one, @solution.process_line(hand: "K8TK6", bid: 0)[:type]
    assert_equal :high, @solution.process_line(hand: "K8TQ6", bid: 0)[:type]
  end

  def test_sample_part_1
    input = <<~EOF
32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483
    EOF

    assert_equal 6440, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split(/\n/)

    assert_equal 248453531, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
    EOF

    # assert_equal 4242, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split(/\n/)

    # assert_equal 4242, @solution.part2(input)
  end
end
