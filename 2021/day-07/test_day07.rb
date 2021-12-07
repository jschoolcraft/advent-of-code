require "minitest/autorun"
require "./day07"

class TestDay07 < Minitest::Test
  def setup
    @solution = Year2021::Day07.new
  end

  def test_sample_part_1
    input = <<~EOF
      16,1,2,0,4,2,7,1,2,14
    EOF

    assert_equal 37, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split

    assert_equal 326132, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      16,1,2,0,4,2,7,1,2,14
    EOF

    assert_equal 168, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split

    assert_equal 88612508, @solution.part2(input)
  end
end
