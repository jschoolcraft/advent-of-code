require "minitest/autorun"
require "./day09"

class TestDay09 < Minitest::Test
  def setup
    @solution = Year2023::Day09.new
  end

  def test_next_value_end
    # assert_equal 18, @solution.next_value_end([0, 3, 6, 9, 12, 15])
    # assert_equal 28, @solution.next_value_end([1, 3, 6, 10, 15, 21])
    # assert_equal 68, @solution.next_value_end([10, 13, 16, 21, 30, 45])
    # assert_equal 735, @solution.next_value_end([-7, -14, -27, -48, -70, -69, 4, 231])
  end

  def test_sample_part_1
    input = <<~EOF
0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45
    EOF

    # assert_equal 114, @solution.part1(input)
  end

  def test_part_1
    input = File.read("./input.txt")

    # assert_equal 1974232246, @solution.part1(input)
  end

  def test_next_value_beginning
    assert_equal -3, @solution.next_value_beginning([0, 3, 6, 9, 12, 15])
    assert_equal 0, @solution.next_value_beginning([1, 3, 6, 10, 15, 21])
    assert_equal 5, @solution.next_value_beginning([10, 13, 16, 21, 30, 45])
  end

  def test_sample_part_2
    input = <<~EOF
0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45
    EOF

    assert_equal 2, @solution.part2(input)
  end

  def test_part_2
    input = File.read("./input.txt")

    assert_equal 4242, @solution.part2(input)
  end
end
