require 'minitest/autorun'
require_relative 'part2'

class Day3Test < Minitest::Test
  def setup
input =<<~EOF
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
EOF

    @day3 = Day3.new(input.split(/\n/))
  end

  def test_find_numbers_and_indices
    line = "467..114.."
    assert_includes @day3.find_numbers_and_indices(line, 0), [467, 0, 0, 2]
    assert_includes @day3.find_numbers_and_indices(line, 0), [114, 0, 5, 7]

    line = "...*......"
    assert_empty @day3.find_numbers_and_indices(line, 1)

    line = "..35..633."
    assert_includes @day3.find_numbers_and_indices(line, 2), [35, 2, 2, 3]
    assert_includes @day3.find_numbers_and_indices(line, 2), [633, 2, 6, 8]

    line = "......#..."
    assert_empty @day3.find_numbers_and_indices(line, 3)

    line = "617*......"
    assert_includes @day3.find_numbers_and_indices(line, 4), [617, 4, 0, 2]

    line = ".....+.58."
    assert_includes @day3.find_numbers_and_indices(line, 5), [58, 5, 7, 8]

    line = "..592....."
    assert_includes @day3.find_numbers_and_indices(line, 6), [592, 6, 2, 4]

    line = "......755."
    assert_includes @day3.find_numbers_and_indices(line, 7), [755, 7, 6, 8]

    line = "...$.*...."
    assert_empty @day3.find_numbers_and_indices(line, 8)

    line = ".664.598.."
    assert_includes @day3.find_numbers_and_indices(line, 9), [664, 9, 1, 3]
    assert_includes @day3.find_numbers_and_indices(line, 9), [598, 9, 5, 7]
  end

  def test_find_star_and_index
    assert_empty @day3.find_star_indices("467..114..")
    assert_equal [3], @day3.find_star_indices("...*......")
    assert_empty @day3.find_star_indices("..35..633.")
    assert_equal [], @day3.find_star_indices("......#...")
    assert_equal [3], @day3.find_star_indices("617*......")
    assert_empty @day3.find_star_indices(".....+.58.")
    assert_empty @day3.find_star_indices("..592.....")
    assert_equal [], @day3.find_star_indices("......755.")
    assert_equal [5], @day3.find_star_indices("...$.*....")
    assert_equal [], @day3.find_star_indices(".664.598..")
    assert_equal [9], @day3.find_star_indices(".664.598.*")
    assert_equal [0, 4, 9], @day3.find_star_indices("*664*598.*")
  end

  def test_find_adjacent_part_numbers
    part_numbers = [[467, 0, 0, 2], [35, 2, 2, 3], [633, 2, 6, 8], [617, 4, 0, 2], [592, 6, 2, 4], [755, 7, 6, 8], [664, 9, 1, 3], [598, 9, 5, 7]]
    line = 1
    gear_index = 3
    assert_includes @day3.find_adjacent_part_numbers(line:, gear_index:, part_numbers:), 467
    assert_includes @day3.find_adjacent_part_numbers(line:, gear_index:, part_numbers:), 35
  end

  def test_gear_ratios
    assert_includes @day3.gear_ratios, [467, 35]
  end

  def test_part2
    assert_equal 467835, @day3.part2
    assert_equal 77509019, Day3.new(File.read("input.txt").split(/\n/)).part2
  end
end
