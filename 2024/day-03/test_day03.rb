require "minitest/autorun"
require "./day03"

class TestDay03 < Minitest::Test
  def setup
    @solution = Year2024::Day03.new
  end

  def test_it_works
    assert true
  end

  def test_sample_part_1
    input = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
    assert_equal 161, @solution.part1(input)
  end

  def test_part_1
    input = File.read("./input.txt")

    assert_equal 175615763, @solution.part1(input)
  end

  def test_sample_part_2
    input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
    assert_equal 48, @solution.part2(input)
  end

  def test_part_2
    input = File.read("./input.txt")

    assert_equal 74361272, @solution.part2(input)
  end
end
