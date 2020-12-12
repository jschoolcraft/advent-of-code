require "minitest/autorun"
require "./day12"

class TestDay12 < Minitest::Test
  def setup
    @solution = Year2020::Day12.new
  end

  def test_sample_part_1
    input = <<~EOF
      F10
      N3
      F7
      R90
      F11
    EOF

    assert_equal 25, @solution.part1(input.split(/\n/))
  end

  def test_move
    assert_equal [7, 0] , @solution.move(north: 0, east: 0, action: "N", value: 7)
    assert_equal [0, 3] , @solution.move(north: 0, east: 0, action: "E", value: 3)
    assert_equal [10, 3] , @solution.move(north: 0, east: 3, action: "N", value: 10)
    assert_equal [10, -6] , @solution.move(north: 10, east: 3, action: "W", value: 9)
  end

  def test_turn
    assert_equal "N", @solution.turn(facing: "E", turn: "L", value: 90)
    assert_equal "S", @solution.turn(facing: "E", turn: "R", value: 90)
    assert_equal "S", @solution.turn(facing: "S", turn: "R", value: 360)
    assert_equal "S", @solution.turn(facing: "S", turn: "R", value: 0)
    assert_equal "W", @solution.turn(facing: "S", turn: "L", value: 270)
    assert_equal "W", @solution.turn(facing: "S", turn: "R", value: 90)
    assert_equal "W", @solution.turn(facing: "S", turn: "R", value: 90)
  end

  def test_part_1
    input = File.read("./input.txt").split

    assert_equal 858, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      F10
      N3
      F7
      R90
      F11
    EOF

    assert_equal 286, @solution.part2(input.split(/\n/))
  end

  def test_move_to_waypoint
    assert_equal [10, 100], @solution.move_to_waypoint(wp_n: 1, wp_e: 10, north: 0, east: 0, value: 10)
    assert_equal [38, 170], @solution.move_to_waypoint(wp_n: 4, wp_e: 10, north: 10, east: 100, value: 7)
  end

  def test_move_waypoint
    assert_equal [4, 10], @solution.move_waypoint(north: 1, east: 10, action: "N", value: 3)
  end

  def test_rotate_waypoint
    assert_equal [-10, 4], @solution.rotate_waypoint(wp_n: 4, wp_e: 10, turn: "R", value: 90)
    assert_equal [-4, -10], @solution.rotate_waypoint(wp_n: 4, wp_e: 10, turn: "R", value: 180)
    assert_equal [10, -4], @solution.rotate_waypoint(wp_n: 4, wp_e: 10, turn: "R", value: 270)
    assert_equal [4, 10], @solution.rotate_waypoint(wp_n: 4, wp_e: 10, turn: "R", value: 0)
    assert_equal [4, 10], @solution.rotate_waypoint(wp_n: 4, wp_e: 10, turn: "R", value: 360)

    assert_equal [10, -4], @solution.rotate_waypoint(wp_n: 4, wp_e: 10, turn: "L", value: 90)
    assert_equal [-4, -10], @solution.rotate_waypoint(wp_n: 4, wp_e: 10, turn: "L", value: 180)
    assert_equal [-10, 4], @solution.rotate_waypoint(wp_n: 4, wp_e: 10, turn: "L", value: 270)
    assert_equal [4, 10], @solution.rotate_waypoint(wp_n: 4, wp_e: 10, turn: "L", value: 0)
    assert_equal [4, 10], @solution.rotate_waypoint(wp_n: 4, wp_e: 10, turn: "L", value: 360)
  end

  def test_part_2
    input = File.read("./input.txt").split

    assert_equal 39140, @solution.part2(input)
  end
end
