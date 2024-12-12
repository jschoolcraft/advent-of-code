require "minitest/autorun"
require "./day11"

class TestDay11 < Minitest::Test
  def setup
    @solution = Year2024::Day11.new
  end

  def test_sample_part_1
    input = sample_data

    assert_equal 55312, @solution.part1(input.split(/\n/).first)
  end

  def test_part_1_blink
    assert_equal [253000, 1, 7], @solution.blink([125, 17])
    assert_equal [253, 0, 2024, 14168], @solution.blink([253000, 1, 7])
    assert_equal [512072, 1, 20, 24, 28676032], @solution.blink([253, 0, 2024, 14168])
  end

  def test_part_1
    input = File.readlines("./input.txt").first

    assert_equal 182081, @solution.part1(input)
  end

  # def test_sample_part_2
  #   input = sample_data

  #   assert_equal 4242, @solution.part2(input.split(/\n/).first)
  # end

  def test_part_2
    input = File.readlines("./input.txt").first

    assert_equal 4242, @solution.part2(input)
  end

  def sample_data
    <<~EOF
    125 17
    EOF
  end
end
