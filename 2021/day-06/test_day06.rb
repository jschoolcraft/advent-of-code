require "minitest/autorun"
require "./day06"

class TestDay06 < Minitest::Test
  def setup
    @solution = Year2021::Day06.new
  end

  def test_it_works
    assert true
  end

  def test_sample_part_1
    input = <<~EOF
      3,4,3,1,2
    EOF

    assert_equal 26, @solution.part1(input, 18)
    assert_equal 5934, @solution.part1(input, 80)
  end

  def test_part_1
    input = File.read("./input.txt")

    assert_equal 361169, @solution.part1(input, 80)
  end

  def test_sample_part_2
    input = <<~EOF
      3,4,3,1,2
    EOF

    assert_equal 26984457538, @solution.part1(input, 256)
  end

  def test_part_2
    input = File.read("./input.txt")

    assert_equal 4242, @solution.part1(input, 256)
  end
end
