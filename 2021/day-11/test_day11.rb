require "minitest/autorun"
require "./day11"

class TestDay11 < Minitest::Test
  def setup
    @solution = Year2021::Day11.new
  end

  def test_sample_part_1
    input = <<~EOF
      5483143223
      2745854711
      5264556173
      6141336146
      6357385478
      4167524645
      2176841721
      6882881134
      4846848554
      5283751526
    EOF

    assert_equal 204, @solution.part1(input.split(/\n/), steps: 10)
    assert_equal 1656, @solution.part1(input.split(/\n/), steps: 100)
  end

  def test_part_1
    input = File.read("./input.txt").split

    assert_equal 1721, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      5483143223
      2745854711
      5264556173
      6141336146
      6357385478
      4167524645
      2176841721
      6882881134
      4846848554
      5283751526
    EOF

    assert_equal 195, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split

    assert_equal 298, @solution.part2(input)
  end
end
