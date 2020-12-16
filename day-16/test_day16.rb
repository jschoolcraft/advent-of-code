require "minitest/autorun"
require "./day16"

class TestDay16 < Minitest::Test
  def setup
    @solution = Year2020::Day16.new
  end

  def test_sample_part_1
    skip
    input = <<~EOF
      class: 1-3 or 5-7
      row: 6-11 or 33-44
      seat: 13-40 or 45-50

      your ticket:
      7,1,14

      nearby tickets:
      7,3,47
      40,4,50
      55,2,20
      38,6,12
    EOF

    assert_equal 71, @solution.part1(input.split(/\n\n/))
  end

  def test_part_1
    skip
    input = File.read("./input.txt").split(/\n\n/)

    assert_equal 20231, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      class: 0-1 or 4-19
      row: 0-5 or 8-19
      seat: 0-13 or 16-19

      your ticket:
      11,12,13

      nearby tickets:
      3,9,18
      15,1,5
      5,14,9
    EOF

    assert_equal 71, @solution.part2(input.split(/\n\n/))
  end

  def test_part_2
    skip
    input = File.read("./input.txt").split

    assert_equal 4242, @solution.part2(input)
  end
end
