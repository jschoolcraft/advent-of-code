require "minitest/autorun"
require "./day01"

class TestDay01 < Minitest::Test
  def setup
    @solution = Year2020::Day01.new
  end

  def test_it_works
    assert true
  end

  def test_sample_part_1
    input = <<~EOF
      1721
      979
      366
      299
      675
      1456
    EOF

    assert_equal 514579, @solution.part1(input.split)
  end

  def test_part_1
    input = File.read("./input.txt").split

    assert_equal 1005459, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      1721
      979
      366
      299
      675
      1456
    EOF

    assert_equal 241861950, @solution.part2(input.split)
  end

  def test_part_2
    input = File.read("./input.txt").split

    assert_equal 92643264, @solution.part2(input)
  end
end
