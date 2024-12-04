require "minitest/autorun"
require "./part2"

class TestDay04 < Minitest::Test
  def setup
    @solution = Year2023::Day04.new
  end

  def test_sample_part_2
    input = <<~EOF
Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
    EOF

    assert_equal 30, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split(/\n/)

    assert_equal 6874754, @solution.part2(input)
  end
end
