require "minitest/autorun"
require "./day09"

class TestDay09 < Minitest::Test
  def setup
    @solution = Year2020::Day09.new
  end

  def test_sample_part_1
    input = <<~EOF
      35
      20
      15
      25
      47
      40
      62
      55
      65
      95
      102
      117
      150
      182
      127
      219
      299
      277
      309
      576
    EOF

    assert_equal 127, @solution.part1(input.split(/\n/), 5)
  end

  def test_part_1
    input = File.read("./input.txt").split

    assert_equal 257342611, @solution.part1(input, 25)
  end

  def test_sample_part_2
    input = <<~EOF
      35
      20
      15
      25
      47
      40
      62
      55
      65
      95
      102
      117
      150
      182
      127
      219
      299
      277
      309
      576
    EOF

    assert_equal 62, @solution.part2(input.split(/\n/), 127)
  end

  def test_part_2
    input = File.read("./input.txt").split

    assert_equal 35602097, @solution.part2(input, 257342611)
  end
end
