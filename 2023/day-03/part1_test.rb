require 'minitest/autorun'
require_relative 'part1'

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

  def test_parses_input
    assert_equal 10, @day3.input.size
  end

  def test_symbol_above
    assert_equal [], @day3.symbols_above(number: 42, line: 0, start: -1)
    assert_equal [], @day3.symbols_above(number: 467, line: 0, start: 0)
    assert_equal [], @day3.symbols_above(number: 114, line: 0, start: 5)
    assert_equal [nil, "*", nil, nil, nil], @day3.symbols_above(number: 598, line: 9, start: 5)
    assert_equal [nil, nil, "*", nil], @day3.symbols_above(number: 35, line: 2, start: 2)
    assert_equal [nil, nil, nil, nil, nil], @day3.symbols_above(number: 633, line: 2, start: 6)
    assert_equal [nil, nil, nil, nil, "+"], @day3.symbols_above(number: 592, line: 6, start: 2)
    assert_equal [nil, nil, nil, "$", nil], @day3.symbols_above(number: 664, line: 9, start: 1)
    assert_equal [nil, "*", nil, nil, nil], @day3.symbols_above(number: 598, line: 9, start: 5)
    assert_equal [nil, nil, nil, nil], @day3.symbols_above(number: 617, line: 4, start: 0)
    assert_equal [nil, nil, nil, nil], @day3.symbols_above(number: 58, line: 5, start: 7)
  end

  def test_symbols_below
    assert_equal [], @day3.symbols_below(number: 598, line: 9, start: 5)
    assert_equal [], @day3.symbols_below(number: 664, line: 9, start: 1)
    assert_equal [nil, nil, nil, nil], @day3.symbols_below(number: 35, line: 2, start: 2)
    assert_equal [nil, nil, nil, "*"], @day3.symbols_below(number: 467, line: 0, start: 0)
    assert_equal [nil, nil, nil, nil, nil], @day3.symbols_below(number: 114, line: 0, start: 5)
    assert_equal ["*", nil, nil, nil, nil], @day3.symbols_below(number: 755, line: 7, start: 6)
    assert_equal [nil, "#", nil, nil, nil], @day3.symbols_below(number: 633, line: 2, start: 6)
    assert_equal [nil, nil, nil, nil], @day3.symbols_below(number: 617, line: 4, start: 0)
    assert_equal [nil, nil, nil, nil], @day3.symbols_below(number: 58, line: 5, start: 7)
    assert_equal [nil, nil, nil, nil, nil], @day3.symbols_below(number: 592, line: 6, start: 2)

input =<<~EOF
..........
..88......
....*.....
EOF
    day3 = Day3.new(input.split(/\n/))
    assert_equal [nil, nil, nil, "*"], day3.symbols_below(number: 88, line: 1, start: 2)


input =<<~EOF
..........
.......237
......+...
EOF
    day3 = Day3.new(input.split(/\n/))
    assert_equal ["+", nil, nil, nil], day3.symbols_below(number: 237, line: 1, start: 7)
  end

  def test_symbols_right
    assert_equal ["*"], @day3.symbols_right(number: 617, line: 4, start: 0)
    assert_equal [nil], @day3.symbols_right(number: 598, line: 9, start: 5)
    assert_equal [], @day3.symbols_right(number: 598, line: 9, start: 7)
    assert_equal [nil], @day3.symbols_right(number: 467, line: 0, start: 0)
    assert_equal [nil], @day3.symbols_right(number: 114, line: 0, start: 5)
    assert_equal [nil], @day3.symbols_right(number: 35, line: 2, start: 2)
    assert_equal [nil], @day3.symbols_right(number: 58, line: 5, start: 7)
    assert_equal [nil], @day3.symbols_right(number: 592, line: 6, start: 2)
  end

  def test_symbols_left
    assert_equal [], @day3.symbols_left(number: 467, line: 0, start: 0)
    assert_equal [], @day3.symbols_left(number: 617, line: 4, start: 0)
    assert_equal [nil], @day3.symbols_left(number: 114, line: 0, start: 5)
    assert_equal [nil], @day3.symbols_left(number: 35, line: 2, start: 2)
    assert_equal [nil], @day3.symbols_left(number: 58, line: 5, start: 7)
    assert_equal [nil], @day3.symbols_left(number: 592, line: 6, start: 2)

input =<<~EOF
467..114..
...*......
..35..633.
......#...
617*......
......+58.
..592.....
......755.
...$.*....
.664.598..
EOF
    day3 = Day3.new(input.split(/\n/))
    assert_equal ["+"], day3.symbols_left(number: 58, line: 5, start: 7)
  end

  def test_part_numbers2
    assert_includes @day3.part_numbers, 467
  end

  def test_part_numbers_with_sample_input
    puts @day3.input
    assert_includes @day3.part_numbers, 467
    assert_includes @day3.part_numbers, 35
    assert_includes @day3.part_numbers, 633
    assert_includes @day3.part_numbers, 617
    assert_includes @day3.part_numbers, 592
    assert_includes @day3.part_numbers, 755
    assert_includes @day3.part_numbers, 664
    assert_includes @day3.part_numbers, 598
    refute_includes @day3.part_numbers, 114
    refute_includes @day3.part_numbers, 58
  end

  def test_edge_case_941
input =<<~EOF
....
.941
*...
EOF
    day3 = Day3.new(input.split(/\n/))
    assert_includes day3.find_numbers_and_indices(".941"), [941, 1]
    assert_includes day3.part_numbers, 941
  end

  def test_part_numbers_edge_cases
input =<<~EOF
....
.273
....
EOF
    day3 = Day3.new(input.split(/\n/))
    refute_includes day3.part_numbers, 273

input =<<~EOF
...
.3.
...
EOF
    day3 = Day3.new(input.split(/\n/))
    refute_includes day3.part_numbers, 3

input =<<~EOF
....
.82.
...*
EOF
    day3 = Day3.new(input.split(/\n/))
    assert_includes day3.part_numbers, 82

input =<<~EOF
....
.941
*...
EOF
    day3 = Day3.new(input.split(/\n/))
    assert_includes day3.part_numbers, 941

input =<<~EOF
....
.11.
EOF
    day3 = Day3.new(input.split(/\n/))
    refute_includes day3.part_numbers, 11



input =<<~EOF
.....
-113.
.....
EOF
    day3 = Day3.new(input.split(/\n/))
    refute_includes day3.part_numbers, -113
    assert_includes day3.part_numbers, 113


input =<<~EOF
..*
.7.
...
EOF
    day3 = Day3.new(input.split(/\n/))
    assert_includes day3.part_numbers, 7


input =<<~EOF
...
.6.
...
EOF
    day3 = Day3.new(input.split(/\n/))
    refute_includes day3.part_numbers, 6

input =<<~EOF
+...
.446
EOF
    day3 = Day3.new(input.split(/\n/))
    assert_includes day3.part_numbers, 446
  end

  def test_edge_case
    day3 = Day3.new(File.read("input.txt").split(/\n/))
    assert_includes day3.part_numbers, 446
    assert_equal [], day3.symbols_right(number: 446, line: 139, start: 137)
  end

  def test_part_nubmers_is_reasonable_size
    day3 = Day3.new(File.read("input.txt").split(/\n/))
    assert day3.part_numbers.size < File.read("input.txt").scan(/\d+/).size

    solution_part_numbers = day3.part_numbers.tally
    input_possible_numbers = File.read("input.txt").scan(/\d+/).map(&:to_i).tally

    solution_part_numbers.keys.each do |key|
      assert solution_part_numbers[key] <= input_possible_numbers[key]
    end
  end

  def test_find_numbers_and_indices
    line = "467..114.."
    assert_includes @day3.find_numbers_and_indices(line), [467, 0]
    assert_includes @day3.find_numbers_and_indices(line), [114, 5]

    line = "...*......"
    assert_empty @day3.find_numbers_and_indices(line)

    line = "..35..633."
    assert_includes @day3.find_numbers_and_indices(line), [35, 2]
    assert_includes @day3.find_numbers_and_indices(line), [633, 6]

    line = "......#..."
    assert_empty @day3.find_numbers_and_indices(line)

    line = "617*......"
    assert_includes @day3.find_numbers_and_indices(line), [617, 0]

    line = ".....+.58."
    assert_includes @day3.find_numbers_and_indices(line), [58, 7]

    line = "..592....."
    assert_includes @day3.find_numbers_and_indices(line), [592, 2]

    line = "......755."
    assert_includes @day3.find_numbers_and_indices(line), [755, 6]

    line = "...$.*...."
    assert_empty @day3.find_numbers_and_indices(line)

    line = ".664.598.."
    assert_includes @day3.find_numbers_and_indices(line), [664, 1]
    assert_includes @day3.find_numbers_and_indices(line), [598, 5]
  end

  def test_part1
    day3 = Day3.new(File.read("input.txt").split(/\n/))
    assert_includes day3.part_numbers, 7
    assert_includes day3.part_numbers, 13
    # refute_includes day3.part_numbers, 446
    # refute_includes day3.part_numbers, 6

    assert_equal 4361, @day3.part1
    assert_equal 529618, Day3.new(File.read("input.txt").split(/\n/)).part1
    assert_equal 522726, Day3.new(File.read("input2.txt").split(/\n/)).part1
  end
end
