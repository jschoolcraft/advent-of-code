require "minitest/autorun"
require "./day15"

class TestDay15 < Minitest::Test
  def setup
    @solution = Year2021::Day15.new
  end

  def test_sample_part_1
    input = <<~EOF
      1163751742
      1381373672
      2136511328
      3694931569
      7463417111
      1319128137
      1359912421
      3125421639
      1293138521
      2311944581
    EOF

    assert_equal 40, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    skip
    input = File.read("./input.txt").split

    assert_equal 42, @solution.part1(input)
  end

  def test_sample_part_2
    skip
    input = <<~EOF
    EOF

    assert_equal 4242, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    skip
    input = File.read("./input.txt").split

    assert_equal 4242, @solution.part2(input)
  end
end
