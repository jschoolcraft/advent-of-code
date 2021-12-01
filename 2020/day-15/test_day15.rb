require "minitest/autorun"
require "./day15"

class TestDay15 < Minitest::Test
  def setup
    @solution = Year2020::Day15.new
  end

  def test_sample_part_1
    assert_equal 436, @solution.part1([0, 3, 6], 2020)
    assert_equal 1, @solution.part1([1, 3, 2], 2020)
    assert_equal 27, @solution.part1([1, 2, 3], 2020)
    assert_equal 78, @solution.part1([2, 3, 1], 2020)
    assert_equal 438, @solution.part1([3, 2, 1], 2020)
    assert_equal 1836, @solution.part1([3, 1, 2], 2020)
  end

  def test_part_1
    input = File.read("./input.txt").split(/,/).map(&:to_i)

    assert_equal 1015, @solution.part1(input, 2020)
  end

  def test_sample_part_2
    assert_equal 175594, @solution.part1([0, 3, 6], 30000000)
  end

  def test_part_2
    skip
    input = File.read("./input.txt").split

    assert_equal 4242, @solution.part2(input)
  end
end
