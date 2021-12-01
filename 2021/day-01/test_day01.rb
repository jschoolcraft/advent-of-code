require "minitest/autorun"
require "./day01"

class TestDay01 < Minitest::Test
  def setup
    @solution = Year2021::Day01.new
  end

  def test_it_works
    assert true
  end

  def test_sample_part_1
    input = <<~EOF
      199
      200
      208
      210
      200
      207
      240
      269
      260
      263
    EOF

    assert_equal 7, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split

    assert_equal 1527, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      199
      200
      208
      210
      200
      207
      240
      269
      260
      263
    EOF

    assert_equal 5, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split

    assert_equal 4242, @solution.part2(input)
  end
end
