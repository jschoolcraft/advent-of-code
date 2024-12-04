require 'byebug'

class Day3
  attr_reader :input

  def initialize(input)
    @input = input

    @schematic = []
    @input.each do |line|
      @schematic << line.chars.map do |c|
        if c == '.'
          nil
        elsif c =~ /\d/
          c #.to_i
        else
          c
        end
      end
    end
    @schematic_height = @schematic.size - 1
    @schematic_width = @schematic.first.size - 1
  end

  def symbols_above(number:, line:, start:)
    return [] if line == 0

    left_bound = [start - 1, 0].max

    size = number.to_s.chars.size + 2
    # if we're at the edge we only want to pick one more (the right or left edge)
    size -= 1 if start == 0

    @schematic[line-1][left_bound, size]
  end

  def symbols_below(number:, line:, start:)
    return [] if line >= @schematic_height

    left_bound = [start - 1, 0].max

    size = number.to_s.chars.size + 2
    # if we're at the edge we only want to pick one more (the right or left edge)
    size -= 1 if start == 0

    @schematic[line+1][left_bound, size]
  end

  def symbols_left(number:, line:, start:)
    return [] if start == 0

    @schematic[line][start - 1, 1]
  end

  def symbols_right(number:, line:, start:)
    # assert_equal [], day3.symbols_right(number: 446, line: 139, start: 136)
    # byebug if number == 446 && line == 139
    return [] if start + number.to_s.chars.size > @schematic_width

    @schematic[line][start + number.to_s.chars.size, 1]
  end

  def debug_symbols(number:, line:, start:)
    above = symbols_above(number:, line:, start:).map { |c| c.nil? ? "." : c }
    below = symbols_below(number:, line:, start:).map { |c| c.nil? ? "." : c }
    left = symbols_left(number:, line:, start:).map { |c| c.nil? ? "." : c }
    right = symbols_right(number:, line:, start:).map { |c| c.nil? ? "." : c }

    puts above.join
    puts (left + number.to_s.chars + right).join
    puts below.join
  end


  def valid_part?(number:, line:, start:)
    symbols = []
    symbols += symbols_above(number:, line:, start:)
    symbols += symbols_below(number:, line:, start:)
    symbols += symbols_left(number:, line:, start:)
    symbols += symbols_right(number:, line:, start:)
    symbols.compact!.reject! { |c| c =~ /\d/ }

    symbols.size > 0
  end

  def find_numbers_and_indices(line, line_number)
    # puts format("find_numbers_and_indices: %s", line)
    numbers = []
    current = ""
    initial_index = -1
    line.chars.each_with_index do |c, index|
      if c =~ /\d/
        current += c
        initial_index = index if initial_index == -1
      else
        if current.length > 0
          numbers << [current.to_i, line_number, initial_index, initial_index + current.length - 1]
          current = ""
          initial_index = -1
        end
      end
    end
    # catch when the number ends at the end of a line
    if current.length > 0
      numbers << [current.to_i, line_number, initial_index, initial_index + current.length - 1]
    end
    numbers
  end

  def find_star_indices(line)
    line.chars.each_with_index.select { |a,b| a == "*" }.map(&:last)
  end

  def part_numbers
    part_numbers = []

    @input.each_with_index do |line, index|
      find_numbers_and_indices(line, index).each do |number, line_number, start, stop|
        if valid_part?(number: number, line: index, start: start)
          part_numbers << [number, line_number, start, stop]
        end
      end
    end

    part_numbers
  end

  def find_adjacent_part_numbers(line:, gear_index:, part_numbers:)
    # puts format("line: %s, gear_index: %s, part_numbers: %s", line, gear_index, part_numbers)
    adjacent = []
    # find above
    adjacent += part_numbers.select { |n| n[1] == line - 1 && Range.new(n[2], n[3]).include?(gear_index) }
    adjacent += part_numbers.select { |n| n[1] == line - 1 && Range.new(n[2], n[3]).include?(gear_index - 1) }
    adjacent += part_numbers.select { |n| n[1] == line - 1 && Range.new(n[2], n[3]).include?(gear_index + 1) }

    # find below
    adjacent += part_numbers.select { |n| n[1] == line + 1 && Range.new(n[2], n[3]).include?(gear_index) }
    adjacent += part_numbers.select { |n| n[1] == line + 1 && Range.new(n[2], n[3]).include?(gear_index - 1) }
    adjacent += part_numbers.select { |n| n[1] == line + 1 && Range.new(n[2], n[3]).include?(gear_index + 1) }

    # find right
    adjacent += part_numbers.select { |n| n[1] == line && Range.new(n[2], n[3]).include?(gear_index - 1) }

    # find left
    adjacent += part_numbers.select { |n| n[1] == line && Range.new(n[2], n[3]).include?(gear_index + 1) }
    adjacent.compact.uniq.map(&:first)
  end

  def gear_ratios
    gear_ratios = []
    @input.each_with_index do |line, index|
      find_star_indices(line).each do |gear_index|
        parts = find_adjacent_part_numbers(line: index, gear_index:, part_numbers:)
        gear_ratios << parts if parts.size == 2
      end
    end
    gear_ratios
  end

  def part2
    # puts gear_ratios.inspect
    gear_ratios.map { |gr| gr.reduce(:*) }.sum
  end
end

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

puts Day3.new(input.split(/\n/)).part2
# puts Day3.new(File.read("input.txt").split(/\n/)).part2
# puts Day3.new(File.read("input2.txt").split(/\n/)).part2
