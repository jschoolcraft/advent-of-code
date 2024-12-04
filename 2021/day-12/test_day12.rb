require "minitest/autorun"
require "./day12"

class TestDay12 < Minitest::Test
  def setup
    @solution = Year2021::Day12.new
  end

  def test_sample_part_1
    input = <<~EOF
      start-A
      start-b
      A-c
      A-b
      b-d
      A-end
      b-end
    EOF

    assert_equal 10, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    skip
    input = File.read("./input.txt").split

    assert_equal 42, @solution.part1(input)
  end

  def test_sample_part_2
    skip
    input = <<~EOF
    EOF

    assert_equal 4242, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    skip
    input = File.read("./input.txt").split

    assert_equal 4242, @solution.part2(input)
  end
end
