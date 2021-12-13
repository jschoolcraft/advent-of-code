require "minitest/autorun"
require "./day13"

class TestDay13 < Minitest::Test
  def setup
    @solution = Year2021::Day13.new
  end

  def test_sample_part_1
    input = <<~EOF
      6,10
      0,14
      9,10
      0,3
      10,4
      4,11
      6,0
      6,12
      4,1
      0,13
      10,12
      3,4
      3,0
      8,4
      1,10
      2,14
      8,10
      9,0

      fold along y=7
      fold along x=5
    EOF

    assert_equal 17, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split(/\n/)

    assert_equal 737, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      6,10
      0,14
      9,10
      0,3
      10,4
      4,11
      6,0
      6,12
      4,1
      0,13
      10,12
      3,4
      3,0
      8,4
      1,10
      2,14
      8,10
      9,0

      fold along y=7
      fold along x=5
    EOF

    # assert_equal 4242, @solution.part2(input.split(/\n/))
    @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split(/\n/)

    # assert_equal 4242, @solution.part2(input)
    @solution.part2(input)
  end
end
