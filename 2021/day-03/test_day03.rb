require "minitest/autorun"
require "./day03"

class TestDay03 < Minitest::Test
  def setup
    @solution = Year2021::Day03.new
  end

  def test_sample_part_1
    input = <<~EOF
      00100
      11110
      10110
      10111
      10101
      01111
      00111
      11100
      10000
      11001
      00010
      01010
    EOF

    assert_equal 198, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split

    assert_equal 1540244, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      00100
      11110
      10110
      10111
      10101
      01111
      00111
      11100
      10000
      11001
      00010
      01010
    EOF

    assert_equal 230, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split

    assert_equal 4203981, @solution.part2(input)
  end
end
