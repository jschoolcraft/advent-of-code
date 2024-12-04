require "minitest/autorun"
require "./day01"

class TestDay01 < Minitest::Test
  def setup
    @solution = Year2024::Day01.new
  end

  def test_sample_part_1
    input = <<~EOF
3   4
4   3
2   5
1   3
3   9
3   3
    EOF

    assert_equal 11, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split(/\n/)

    assert_equal 1722302, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
3   4
4   3
2   5
1   3
3   9
3   3
    EOF

    assert_equal 31, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split(/\n/)

    assert_equal 4242, @solution.part2(input)
  end
end
