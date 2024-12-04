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

    # if symbols.size > 0
       # puts
       # puts format("number: %s, symbols: %s, valid? %s", number, symbols.inspect, symbols.size > 0)
    # end
    symbols.size > 0
  end

  def find_numbers_and_indices(line)
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
          numbers << [current.to_i, initial_index]
          current = ""
          initial_index = -1
        end
      end
    end
    # catch when the number ends at the end of a line
    if current.length > 0
      numbers << [current.to_i, initial_index]
    end
    numbers
  end

  def part_numbers
    part_numbers = []

    # @input.each_with_index do |line, index|
    #   line.scan(/\d+/) do |number|
    #     start_index = if line =~ Regexp.new("^#{number}\\D")
    #                     0
    #                   elsif line =~ Regexp.new("\\D#{number}$")
    #                     line.index(Regexp.new("\\D#{number}$")) + 1
    #                   elsif line =~ Regexp.new("\\D#{number}\\D")
    #                     line.index(Regexp.new("\\D#{number}\\D")) + 1
    #                   else
    #                     byebug
    #                   end

    #     # puts format("number: %s, line: %s, start: %s", number, index, start_index)

    #     if valid_part?(number: number, line: index, start: start_index)
    #       # puts format("Match: %s", number)
    #       # debug_symbols(number: number, line: index, start: start_index)
    #       part_numbers << number
    #     else
    #       # debug_symbols(number: number, line: index, start: start_index)
    #       # puts format("No Match: %s", number)
    #     end
    #   end
    # end
    # part_numbers.map(&:to_i)

    @input.each_with_index do |line, index|
      # puts format("%s: %s", index, line)
      find_numbers_and_indices(line).each do |n, i|
        # puts format("Number: %s, Index: %s", n, i)

        if valid_part?(number: n, line: index, start: i)
          # puts format("Match: %s", number)
          # debug_symbols(number: number, line: index, start: start_index)
          part_numbers << n
        else
          # debug_symbols(number: number, line: index, start: start_index)
          # puts format("No Match: %s", number)
        end
      end
    end

    part_numbers
  end

  def part1
    puts part_numbers.inspect
    part_numbers.sum
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

# puts Day3.new(input.split(/\n/)).part1
puts Day3.new(File.read("input.txt").split(/\n/)).part1
# puts Day3.new(File.read("input2.txt").split(/\n/)).part1
