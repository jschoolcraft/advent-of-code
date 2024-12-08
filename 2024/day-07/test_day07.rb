require "minitest/autorun"
require "./day07"

class TestDay07 < Minitest::Test
  def setup
    @solution = Year2024::Day07.new
  end

  def test_sample_part_1
    input = sample_data

    assert_equal 3749, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.readlines("./input.txt")

    assert_equal 20281182715321, @solution.part1(input)
  end

  def test_sample_part_2
    input = sample_data

    assert_equal 11387, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.readlines("./input.txt")

    assert_equal 159490400628354, @solution.part2(input)
  end

  def sample_data
    <<~EOF
190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20
    EOF
  end
end
