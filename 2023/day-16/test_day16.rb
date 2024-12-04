require "minitest/autorun"
require "./day16"

class TestDay16 < Minitest::Test
  def setup
    @solution = Year2023::Day16.new
  end

  def test_it_works
    assert true
  end

  def test_sample_part_1
    input = <<~EOF
    EOF

    assert_equal 42, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split

    assert_equal 42, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
    EOF

    assert_equal 4242, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split

    assert_equal 4242, @solution.part2(input)
  end
end
