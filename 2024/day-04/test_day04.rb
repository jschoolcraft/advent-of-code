require "minitest/autorun"
require "./day04"

class TestDay04 < Minitest::Test
  def setup
    @solution = Year2024::Day04.new
  end

  def test_sample_part_1
    input = sample_data

    assert_equal 18, @solution.part1(input.split(/\n/))
  end

  def test_sample_find_diagonal
    input = sample_data

    starting_coords = @solution.find_diagonal(input.split(/\n/), "XMAS")
    assert_equal 10, starting_coords.size
  end

  def test_part_1
    input = File.readlines("./input.txt")

    assert_equal 2344, @solution.part1(input)
  end

  def test_sample_part_2
    input = sample_data

    assert_equal 9, @solution.part2(input.split(/\n/))
  end

  def test_sample_find_xs
    input = [[[1, 0], [3, 2]],
             [[5, 1], [7, 3]],
             [[7, 1], [5, 3]],
             [[1, 2], [3, 4]],
             [[1, 2], [3, 0]],
             [[5, 2], [3, 4]],
             [[6, 3], [8, 1]],
             [[8, 3], [6, 1]],
             [[1, 4], [3, 2]],
             [[5, 4], [3, 2]],
             [[8, 4], [6, 6]],
             [[3, 5], [5, 3]],
             [[3, 5], [1, 3]],
             [[4, 5], [6, 7]],
             [[1, 6], [3, 4]],
             [[0, 8], [2, 6]],
             [[2, 8], [4, 6]],
             [[2, 8], [0, 6]],
             [[4, 8], [6, 6]],
             [[4, 8], [2, 6]],
             [[6, 8], [8, 6]],
             [[6, 8], [4, 6]],
             [[7, 8], [9, 6]],
             [[8, 8], [6, 6]],
             [[2, 9], [0, 7]]]

    assert_equal 9, @solution.find_xs(input)
  end

  def test_part_2
    input = File.readlines("./input.txt")

    assert_equal 1815, @solution.part2(input)
  end

  def sample_data
    <<~EOF
MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX
    EOF
  end
end
