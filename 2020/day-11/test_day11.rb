require "minitest/autorun"
require "./day11"

class TestDay11 < Minitest::Test
  def setup
    @solution = Year2020::Day11.new
  end

  def test_sample_part_1
    input = <<~EOF
      L.LL.LL.LL
      LLLLLLL.LL
      L.L.L..L..
      LLLL.LL.LL
      L.LL.LL.LL
      L.LLLLL.LL
      ..L.L.....
      LLLLLLLLLL
      L.LLLLLL.L
      L.LLLLL.LL
    EOF

    assert_equal 37, @solution.part1(input.split(/\n/))
  end

  def test_find_neighbors
    input = <<~EOF
      L.LL.LL.LL
      LLLLLLL.LL
      L.L.L..L..
      LLLL.LL.LL
      L.LL.LL.LL
      L.LLLLL.LL
      ..L.L.....
      LLLLLLLLLL
      L.LLLLLL.L
      L.LLLLL.LL
    EOF
    seats = input.split(/\n/).map(&:chars)
    assert_equal 3, @solution.find_neighbors(seats, 0, 0).size
    assert_equal [".", "L", "L"], @solution.find_neighbors(seats, 0, 0).sort

    assert_equal 3, @solution.find_neighbors(seats, 9, 9).size
    assert_equal [".", "L", "L"], @solution.find_neighbors(seats, 9, 9).sort

    assert_equal 3, @solution.find_neighbors(seats, 9, 0).size
    assert_equal [".", ".", "L"], @solution.find_neighbors(seats, 9, 0).sort

    assert_equal 8, @solution.find_neighbors(seats, 4, 4).size
    assert_equal [".", "L", "L", "L", "L", "L", "L", "L"], @solution.find_neighbors(seats, 4, 4).sort
  end

  def test_part_1
    input = File.read("./input.txt").split(/\n/)

    assert_equal 2448, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      L.LL.LL.LL
      LLLLLLL.LL
      L.L.L..L..
      LLLL.LL.LL
      L.LL.LL.LL
      L.LLLLL.LL
      ..L.L.....
      LLLLLLLLLL
      L.LLLLLL.L
      L.LLLLL.LL
    EOF

    assert_equal 26, @solution.part2(input.split(/\n/))
  end

  def test_find_visible_neighbors
    input = <<~EOF
      L.LL.LL.LL
      LLLLLLL.LL
      L.L.L..L..
      LLLL.LL.LL
      L.LL.LL.LL
      L.LLLLL.LL
      ..L.L.....
      LLLLLLLLLL
      L.LLLLLL.L
      L.LLLLL.LL
    EOF
    seats = input.split(/\n/).map(&:chars)

    assert_equal 7, @solution.find_visible_neighbors(seats, 6, 4).size
    assert_equal ["L", "L", "L", "L", "L", "L", "L"], @solution.find_visible_neighbors(seats, 6, 4).sort

    assert_equal 3, @solution.find_visible_neighbors(seats, 0, 0).size
    assert_equal ["L", "L", "L"], @solution.find_visible_neighbors(seats, 0, 0).sort

    assert_equal 3, @solution.find_visible_neighbors(seats, 9, 9).size
    assert_equal ["L", "L", "L"], @solution.find_visible_neighbors(seats, 9, 9).sort

    assert_equal 3, @solution.find_visible_neighbors(seats, 9, 0).size
    assert_equal ["L", "L", "L"], @solution.find_visible_neighbors(seats, 9, 0).sort
  end

  def test_part_2
    input = File.read("./input.txt").split

    assert_equal 2234, @solution.part2(input)
  end
end
