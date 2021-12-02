require "minitest/autorun"
require "./day02"

class TestDay02 < Minitest::Test
  def setup
    @solution = Year2021::Day02.new
  end

  def test_it_works
    assert true
  end

  def test_sample_part_1
    input = <<~EOF
      forward 5
      down 5
      forward 8
      up 3
      down 8
      forward 2
    EOF

    assert_equal 150, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split(/\n/)

    assert_equal 1451208, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      forward 5
      down 5
      forward 8
      up 3
      down 8
      forward 2
    EOF

    assert_equal 900, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split(/\n/)

    assert_equal 1620141160, @solution.part2(input)
  end
end
