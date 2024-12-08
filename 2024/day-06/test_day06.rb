require "minitest/autorun"
require "./day06"

class TestDay06 < Minitest::Test
  def setup
    @solution = Year2024::Day06.new
  end

  def test_sample_part_1
    input = sample_data

    assert_equal 41, @solution.part1(input.split(/\n/))
  end

  def test_next_space
    grid = sample_data.split(/\n/).map { |line| line.chars }

    assert_equal ".", @solution.next_space(grid, 0, 0, :down)
    assert_equal ".", @solution.next_space(grid, 0, 0, :right)
    assert_equal "*", @solution.next_space(grid, 0, 0, :up)
    assert_equal "*", @solution.next_space(grid, 0, 0, :left)

    assert_equal "*", @solution.next_space(grid, 9, 9, :down)
    assert_equal "*", @solution.next_space(grid, 9, 9, :right)
    assert_equal ".", @solution.next_space(grid, 9, 9, :up)
    assert_equal ".", @solution.next_space(grid, 9, 9, :left)

    assert_equal ".", @solution.next_space(grid, 6, 4, :down)
    assert_equal ".", @solution.next_space(grid, 6, 4, :right)
    assert_equal ".", @solution.next_space(grid, 6, 4, :up)
    assert_equal ".", @solution.next_space(grid, 6, 4, :left)

    assert_equal ".", @solution.next_space(grid, 1, 4, :down)
    assert_equal ".", @solution.next_space(grid, 1, 4, :right)
    assert_equal "#", @solution.next_space(grid, 1, 4, :up)
    assert_equal ".", @solution.next_space(grid, 1, 4, :left)
  end

  def test_change_direction
    assert_equal :right, @solution.change_direction(:up, :right)
    assert_equal :left, @solution.change_direction(:up, :left)
    assert_equal :up, @solution.change_direction(:left, :right)
  end

  def test_part_1
    input = File.readlines("./input.txt")

    assert_equal 5067, @solution.part1(input)
  end

  def test_sample_part_2
    input = sample_data

    assert_equal 6, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.readlines("./input.txt")

    assert_equal 4242, @solution.part2(input)
  end

  def sample_data
    <<~EOF
....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#...
    EOF
  end
end
