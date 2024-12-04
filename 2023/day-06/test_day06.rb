require "minitest/autorun"
require "./day06"

class TestDay06 < Minitest::Test
  def setup
    @solution = Year2023::Day06.new
  end

  def test_sample_part_1
    input = <<~EOF
Time:      7  15   30
Distance:  9  40  200
    EOF

    assert_equal 288, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split(/\n/)

    assert_equal 316800, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
Time:      7  15   30
Distance:  9  40  200
    EOF

    assert_equal 71503, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split(/\n/)

    assert_equal 45647654, @solution.part2(input)
  end
end
