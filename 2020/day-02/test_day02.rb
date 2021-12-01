require "minitest/autorun"
require "./day02"

class TestDay02 < Minitest::Test
  def setup
    @solution = Year2020::Day02.new
  end

  def test_it_works
    assert true
  end

  def test_sample_part_1
    input = <<~EOF
      1-3 a: abcde
      1-3 b: cdefg
      2-9 c: ccccccccc
    EOF
    assert_equal 2, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split(/\n/)

    assert_equal 477, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      1-3 a: abcde
      1-3 b: cdefg
      2-9 c: ccccccccc
    EOF
    assert_equal 1, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split(/\n/)

    assert_equal 686, @solution.part2(input)
  end
end
