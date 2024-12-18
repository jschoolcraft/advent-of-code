require "minitest/autorun"
require "./day02"

class TestDay02 < Minitest::Test
  def setup
    @solution = Year2024::Day02.new
  end

  def test_it_works
    assert true
  end

  def test_sample_part_1
    input = sample_data

    assert_equal 2, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.readlines("./input.txt")

    assert_equal 663, @solution.part1(input)
  end

  def test_sample_part_2
    input = sample_data

    assert_equal 4, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.readlines("./input.txt")

    assert_equal 4242, @solution.part2(input)
  end

  def sample_data
    <<~EOF
7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
    EOF
  end
end
