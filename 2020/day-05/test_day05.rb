require "minitest/autorun"
require "./day05"

class TestDay05 < Minitest::Test
  def setup
    @solution = Year2020::Day05.new
  end

  def test_row
    assert_equal 44, @solution.row_number("FBFBBFFRLR")
    assert_equal 70, @solution.row_number("BFFFBBFRRR")
    assert_equal 14, @solution.row_number("FFFBBBFRRR")
    assert_equal 102, @solution.row_number("BBFFBBFRLL")
  end

  def test_column
    assert_equal 5, @solution.column_number("FBFBBFFRLR")
    assert_equal 7, @solution.column_number("BFFFBBFRRR")
    assert_equal 7, @solution.column_number("FFFBBBFRRR")
    assert_equal 4, @solution.column_number("BBFFBBFRLL")
  end

  def test_seat_id
    assert_equal 357, @solution.seat_id("FBFBBFFRLR")
    assert_equal 567, @solution.seat_id("BFFFBBFRRR")
    assert_equal 119, @solution.seat_id("FFFBBBFRRR")
    assert_equal 820, @solution.seat_id("BBFFBBFRLL")
  end

  def test_sample_part_1
    input = <<~EOF
      FBFBBFFRLR
      BFFFBBFRRR
      FFFBBBFRRR
      BBFFBBFRLL
    EOF

    assert_equal 820, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split

    assert_equal 813, @solution.part1(input)
  end

  def test_part_2
    input = File.read("./input.txt").split

    assert_equal 612, @solution.part2(input)
  end
end
