require "minitest/autorun"
require "./day03"

class TestDay03 < Minitest::Test
  def setup
    @solution = Year2020::Day03.new
  end

  def test_it_works
    assert true
  end

  def test_sample_part_1
    input = <<~EOF
      ..##.......
      #...#...#..
      .#....#..#.
      ..#.#...#.#
      .#...##..#.
      ..#.##.....
      .#.#.#....#
      .#........#
      #.##...#...
      #...##....#
      .#..#...#.#
    EOF

    assert_equal 7, @solution.part1(input.split)
  end

  def test_part_1
    input = File.read("./input.txt").split

    assert_equal 176, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      ..##.......
      #...#...#..
      .#....#..#.
      ..#.#...#.#
      .#...##..#.
      ..#.##.....
      .#.#.#....#
      .#........#
      #.##...#...
      #...##....#
      .#..#...#.#
    EOF

    assert_equal 336, @solution.part2(input.split)
  end

  def test_part_2
    input = File.read("./input.txt").split

    assert_equal 5872458240, @solution.part2(input)
  end
end
