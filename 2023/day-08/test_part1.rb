require "minitest/autorun"
require "./part1"

class TestDay08 < Minitest::Test
  def setup
    @solution = Year2023::Day08.new
  end

  def test_sample_part_1
    input = <<~EOF
RL

AAA = (BBB, CCC)
BBB = (DDD, EEE)
CCC = (ZZZ, GGG)
DDD = (DDD, DDD)
EEE = (EEE, EEE)
GGG = (GGG, GGG)
ZZZ = (ZZZ, ZZZ)
    EOF

    assert_equal 2, @solution.part1(input)

    input = <<~EOF
LLR

AAA = (BBB, BBB)
BBB = (AAA, ZZZ)
ZZZ = (ZZZ, ZZZ)
    EOF

    assert_equal 6, @solution.part1(input)
  end

  def test_part_1
    input = File.read("./input.txt")

    # assert_equal 14681, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
LR

11A = (11B, XXX)
11B = (XXX, 11Z)
11Z = (11B, XXX)
22A = (22B, XXX)
22B = (22C, 22C)
22C = (22Z, 22Z)
22Z = (22B, 22B)
XXX = (XXX, XXX)
    EOF

    assert_equal 6, @solution.part2(input)
  end

  def test_part_2
    input = File.read("./input.txt")

    assert_equal 4242, @solution.part2(input)
  end
end
