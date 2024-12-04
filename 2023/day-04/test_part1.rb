require "minitest/autorun"
require "./part1"

class TestDay04 < Minitest::Test
  def setup
    @solution = Year2023::Day04.new
  end

  def test_it_works
    assert true
  end

  def test_sample_part_1
    input = <<~EOF
Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
    EOF

    assert_equal 13, @solution.part1(input.split(/\n/))
  end

  def test_parse_line
    line = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53"
    assert_equal 3, @solution.parse_line(line).size
    assert_equal "Card 1", @solution.parse_line(line)[0]
    assert_equal [41, 48, 83, 86, 17,], @solution.parse_line(line)[1]
    assert_equal [83, 86, 6, 31, 17, 9, 48, 53, ], @solution.parse_line(line)[2]
  end

  def test_find_winning_numbers
    line = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53"
    card, mine, winning = @solution.parse_line(line)

    winners = @solution.find_winning_numbers(card:, mine:, winning:)
    assert_equal 4, winners.size
    assert_includes winners, 48
    assert_includes winners, 83
    assert_includes winners, 86
    assert_includes winners, 17

    line = "Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19"
    card, mine, winning = @solution.parse_line(line)

    winners = @solution.find_winning_numbers(card:, mine:, winning:)
    assert_equal 2, winners.size
    assert_includes winners, 32
    assert_includes winners, 61

    line = "Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36"
    card, mine, winning = @solution.parse_line(line)

    winners = @solution.find_winning_numbers(card:, mine:, winning:)
    assert_empty winners
  end

  def test_score_card
    line = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53"
    card, mine, winning = @solution.parse_line(line)
    winners = @solution.find_winning_numbers(card:, mine:, winning:)
    assert_equal 8, @solution.score_card(winners)

    line = "Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19"
    card, mine, winning = @solution.parse_line(line)
    winners = @solution.find_winning_numbers(card:, mine:, winning:)
    assert_equal 2, @solution.score_card(winners)

    line = "Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36"
    card, mine, winning = @solution.parse_line(line)
    winners = @solution.find_winning_numbers(card:, mine:, winning:)
    assert_equal 0, @solution.score_card(winners)

  end

  def test_part_1
    input = File.read("./input.txt").split(/\n/)

    assert_equal 21088, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
    EOF

    assert_equal 4242, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split

    assert_equal 4242, @solution.part2(input)
  end
end
