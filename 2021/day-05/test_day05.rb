require "minitest/autorun"
require "./day05"

class TestDay05 < Minitest::Test
  def setup
    @solution = Year2021::Day05.new
  end

  def test_is_diagonal
    assert @solution.is_diagonal?(1, 1, 5, 5)
    assert @solution.is_diagonal?(6, 4, 2, 0)
    assert @solution.is_diagonal?(9, 7, 7, 9)
    assert @solution.is_diagonal?(8, 0, 0, 8)
    refute @solution.is_diagonal?(0, 9, 5, 9)
  end

  def test_line_points
    points = @solution.line_points(0, 9, 5, 9)
    assert_equal 6, points.size

    points = @solution.line_points(9, 4, 3, 4)
    assert_equal 7, points.size

    points = @solution.line_points(2, 2, 2, 1)
    assert_equal 2, points.size
    assert_includes points, [2, 2]
    assert_includes points, [2, 1]
  end

  def test_diagonal_points
    points = @solution.diagonal_points(2, 2, 3, 3)
    assert_equal 2, points.size
    assert_includes points, [2, 2]
    assert_includes points, [3, 3]

    points = @solution.diagonal_points(6, 4, 2, 0)
    assert_equal 5, points.size
    assert_includes points, [6, 4]
    assert_includes points, [5, 3]
    assert_includes points, [4, 2]
    assert_includes points, [3, 1]
    assert_includes points, [2, 0]

    points = @solution.diagonal_points(9, 7, 7, 9)
    assert_equal 3, points.size
  end

  def test_sample_part_1
    input = <<~EOF
      0,9 -> 5,9
      8,0 -> 0,8
      9,4 -> 3,4
      2,2 -> 2,1
      7,0 -> 7,4
      6,4 -> 2,0
      0,9 -> 2,9
      3,4 -> 1,4
      0,0 -> 8,8
      5,5 -> 8,2
    EOF

    assert_equal 5, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split(/\n/)

    assert_equal 6283, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      0,9 -> 5,9
      8,0 -> 0,8
      9,4 -> 3,4
      2,2 -> 2,1
      7,0 -> 7,4
      6,4 -> 2,0
      0,9 -> 2,9
      3,4 -> 1,4
      0,0 -> 8,8
      5,5 -> 8,2
    EOF

    assert_equal 12, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split(/\n/)

    assert_equal 18864, @solution.part2(input)
  end
end
