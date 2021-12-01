require "minitest/autorun"
require "./day06"

class TestDay06 < Minitest::Test
  def setup
    @solution = Year2020::Day06.new
  end

  def test_sample_part_1
    input = <<~EOF
      abc

      a
      b
      c

      ab
      ac

      a
      a
      a
      a

      b
    EOF

    assert_equal 11, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split(/\n/)

    assert_equal 6799, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      abc

      a
      b
      c

      ab
      ac

      a
      a
      a
      a

      b
    EOF

    assert_equal 6, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split(/\n/)

    assert_equal 3354, @solution.part2(input)
  end
end
