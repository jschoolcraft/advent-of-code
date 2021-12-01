require "minitest/autorun"
require "./day10"

class TestDay10 < Minitest::Test
  def setup
    @solution = Year2020::Day10.new
  end

  def test_sample_part_1
    input = <<~EOF
      16
      10
      15
      5
      1
      11
      7
      19
      6
      12
      4
    EOF

    assert_equal 35, @solution.part1(input.split(/\n/))
  end

  def test_sample_part_1_again
    input = <<~EOF
      28
      33
      18
      42
      31
      14
      46
      20
      48
      47
      24
      23
      49
      45
      19
      38
      39
      11
      1
      32
      25
      35
      8
      17
      7
      9
      4
      2
      34
      10
      3
    EOF

    assert_equal 220, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split

    assert_equal 1920, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      16
      10
      15
      5
      1
      11
      7
      19
      6
      12
      4
    EOF

    assert_equal 8, @solution.part2(input.split(/\n/))
  end

  def test_sample_part_2_again
    input = <<~EOF
      28
      33
      18
      42
      31
      14
      46
      20
      48
      47
      24
      23
      49
      45
      19
      38
      39
      11
      1
      32
      25
      35
      8
      17
      7
      9
      4
      2
      34
      10
      3
    EOF

    assert_equal 19208, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split

    assert_equal 1511207993344, @solution.part2(input)
  end
end
