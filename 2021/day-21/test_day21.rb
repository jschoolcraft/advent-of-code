require "minitest/autorun"
require "./day21"

class TestDay21 < Minitest::Test
  def setup
    @solution = Year2021::Day21.new
  end

  def test_deterministic_dice_roll
    dd = Year2021::DeterministicDice.new(100)
    assert_equal 1, dd.roll
    assert_equal 2, dd.roll
    assert_equal 3, dd.roll
    assert_equal 4, dd.roll
    assert_equal 5, dd.roll

    90.times { dd.roll }
    assert_equal 96, dd.roll
    assert_equal 97, dd.roll
    assert_equal 98, dd.roll
    assert_equal 99, dd.roll
    assert_equal 100, dd.roll
    assert_equal 1, dd.roll
    assert_equal 2, dd.roll
  end

  def test_sample_part_1
    input = <<~EOF
      Player 1 starting position: 4
      Player 2 starting position: 8
    EOF

    assert_equal 739785, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split(/\n/)

    assert_equal 503478, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      Player 1 starting position: 4
      Player 2 starting position: 8
    EOF

    assert_equal 4242, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    skip
    input = File.read("./input.txt").split(/\n/)

    assert_equal 4242, @solution.part2(input)
  end
end
