require "minitest/autorun"
require "./day09"

class TestDay09 < Minitest::Test
  def setup
    @solution = Year2021::Day09.new
  end

  def test_lower_than_adjacent
    heights = [
      [2, 1, 9, 9, 9, 4, 3, 2, 1, 0],
      [3, 9, 8, 7, 8, 9, 4, 9, 2, 1],
      [9, 8, 5, 6, 7, 8, 9, 8, 9, 2],
      [8, 7, 6, 7, 8, 9, 6, 7, 8, 9],
      [9, 8, 9, 9, 9, 6, 5, 6, 7, 8]
    ]

    refute @solution.lower_than_adjacent(heights, 0, 0)
    assert @solution.lower_than_adjacent(heights, 0, 1)
    assert @solution.lower_than_adjacent(heights, 0, 9)
    refute @solution.lower_than_adjacent(heights, 1, 7)
  end

  def test_sample_part_1
    input = <<~EOF
      2199943210
      3987894921
      9856789892
      8767896789
      9899965678
    EOF

    assert_equal 15, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split

    assert_equal 500, @solution.part1(input)
  end

  def test_find_basin_points
    heights = [
      [2, 1, 9, 9, 9, 4, 3, 2, 1, 0],
      [3, 9, 8, 7, 8, 9, 4, 9, 2, 1],
      [9, 8, 5, 6, 7, 8, 9, 8, 9, 2],
      [8, 7, 6, 7, 8, 9, 6, 7, 8, 9],
      [9, 8, 9, 9, 9, 6, 5, 6, 7, 8]
    ]

    expected = [
      [0, 0],
      [0, 1],
      [1, 0],
    ]
    assert_equal expected, @solution.find_basin_points(heights, 0, 1).sort

    expected = [
      [0, 9],
      [0, 8],
      [0, 7],
      [0, 6],
      [0, 5],
      [1, 9],
      [1, 8],
      [1, 6],
      [2, 9],
    ].sort
    assert_equal expected, @solution.find_basin_points(heights, 0, 9).sort
  end

  def test_sample_part_2
    input = <<~EOF
      2199943210
      3987894921
      9856789892
      8767896789
      9899965678
    EOF

    assert_equal 1134, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split

    assert_equal 4242, @solution.part2(input)
  end
end
