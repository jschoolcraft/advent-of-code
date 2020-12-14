require "minitest/autorun"
require "./day14"

class TestDay14 < Minitest::Test
  def setup
    @solution = Year2020::Day14.new
  end

  def test_sample_part_1
    skip
    input = <<~EOF
      mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X
      mem[8] = 11
      mem[7] = 101
      mem[8] = 0
    EOF

    assert_equal 165, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    skip
    input = File.read("./input.txt").split(/\n/)

    assert_equal 42, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      mask = 000000000000000000000000000000X1001X
      mem[42] = 100
      mask = 00000000000000000000000000000000X0XX
      mem[26] = 1
    EOF

    assert_equal 208, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split(/\n/)

    assert_equal 4242, @solution.part2(input)
  end
end
