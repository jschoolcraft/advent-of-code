require "minitest/autorun"
require "./day08"

class TestDay08 < Minitest::Test
  def setup
    @solution = Year2020::Day08.new
  end

  def test_sample_part_1
    input = <<~EOF
      nop +0
      acc +1
      jmp +4
      acc +3
      jmp -3
      acc -99
      acc +1
      jmp -4
      acc +6
    EOF

    assert_equal 5, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split(/\n/)

    assert_equal 1949, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      nop +0
      acc +1
      jmp +4
      acc +3
      jmp -3
      acc -99
      acc +1
      jmp -4
      acc +6
    EOF

    assert_equal 8, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split(/\n/)

    assert_equal 2092, @solution.part2(input)
  end
end
