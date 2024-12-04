require "minitest/autorun"
require "./part2"

class TestDay07 < Minitest::Test
  def setup
    @solution = Year2023::Day07.new
  end

  def test_optimize_hand
    assert_equal "32T3K", @solution.optimize_hand(hand: "32T3K")
    assert_equal "32TKK", @solution.optimize_hand(hand: "32TJK")
    assert_equal "KTTTT", @solution.optimize_hand(hand: "KTJJT")
    assert_equal "T5555", @solution.optimize_hand(hand: "T55J5")
  end

  def test_rank_hands
    # assert_equal [], @solution.rank_hands(hands: [])
    # assert_equal [28], @solution.rank_hands(hands: [["KK677", 28]])

    # orig = ["T55J5", "KTJJT", "QQQJA"]
    # new  = ["C5515", "FC11C", "EEE1G"]

    # assert_equal [1, 2, 3], @solution.rank_hands(hands: [["C5515", 1], ["FC11C", 3], ["EEE1G", 2]])
  end


  def test_sample_part_2
    input = <<~EOF
32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483
    EOF

    assert_equal 5905, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split(/\n/)

    # 248036800 too low
    # 248590977 too low
    assert_equal 248781813, @solution.part2(input)
  end
end
