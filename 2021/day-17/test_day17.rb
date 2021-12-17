require "minitest/autorun"
require "./day17"

class TestDay17 < Minitest::Test
  def setup
    @solution = Year2021::Day17.new
  end

  def test_in_target_area
    refute @solution.in_target_area?([0, 0], [[10, 20], [-10, -5]])
    assert @solution.in_target_area?([15, -6], [[10, 20], [-10, -5]])
    assert @solution.in_target_area?([10, -10], [[10, 20], [-10, -5]])
    assert @solution.in_target_area?([20, -5], [[10, 20], [-10, -5]])
    assert @solution.in_target_area?([10, -7], [[10, 20], [-10, -5]])
    assert @solution.in_target_area?([28, -7], [[20, 30], [-10, -5]])
  end

  def test_past_target_area
    refute @solution.past_target_area?([0, 0], [[10, 20], [-10, -5]])
    refute @solution.past_target_area?([10, 0], [[10, 20], [-10, -5]])
    refute @solution.past_target_area?([20, 0], [[10, 20], [-10, -5]])
    assert @solution.past_target_area?([21, 0], [[10, 20], [-10, -5]])

    refute @solution.past_target_area?([0, -5], [[10, 20], [-10, -5]])
    refute @solution.past_target_area?([0, -7], [[10, 20], [-10, -5]])
    refute @solution.past_target_area?([0, -10], [[10, 20], [-10, -5]])
    assert @solution.past_target_area?([0, -11], [[10, 20], [-10, -5]])
  end

  def test_process_shot
    assert @solution.process_shot([7, 2], [[20, 30], [-10, -5]]).first
    assert @solution.process_shot([6, 3], [[20, 30], [-10, -5]]).first
    assert @solution.process_shot([9, 0], [[20, 30], [-10, -5]]).first
    refute @solution.process_shot([17, -4], [[20, 30], [-10, -5]]).first

    hit, max_y, velocity = @solution.process_shot([6, 9], [[20, 30], [-10, -5]])
    assert hit
    assert_equal 45, max_y

    refute @solution.process_shot([6, 10], [[20, 30], [-10, -5]]).first
  end

  def test_sample_part_1
    input = <<~EOF
      target area: x=20..30, y=-10..-5
    EOF

    assert_equal 45, @solution.part1(input.split)
  end

  def test_part_1
    input = File.read("./input.txt").split

    assert_equal 6555, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      target area: x=20..30, y=-10..-5
    EOF

    assert_equal 112, @solution.part2(input.split)
  end

  def test_part_2
    input = File.read("./input.txt").split

    assert_equal 4973, @solution.part2(input)
  end
end
