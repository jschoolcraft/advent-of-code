require "byebug"

module Year2020
  class Day05
    def binary_search(input, rows:, upper_char:, lower_char:)
      upper = rows - 1
      lower = 0
      middle = (upper - lower)/ 2

      input.each do |c|
        middle = ((upper - lower * 1.0)/ 2).ceil
        if c == lower_char
          upper -= middle
        else
          lower += middle
        end
        # puts format("%s -> lower: %s, upper: %s, middle: %s", c, lower, upper, middle)
      end
      lower
    end

    def row_number(pass, rows: 128)
      binary_search(pass.chars.first(7), rows: rows, upper_char: "B", lower_char: "F")
    end

    def column_number(pass, rows: 8)
      binary_search(pass.chars.last(3), rows: rows, upper_char: "R", lower_char: "L")
    end

    def seat_id(input)
      row = row_number(input)
      column = column_number(input)
      row * 8 + column
    end

    def part1(input)
      input.map { |i| seat_id(i) }.sort.last
    end

    def part2(input)
      seat_ids = input.map { |i| seat_id(i) }
      seat_ids.each do |s|
        return s - 1 if seat_ids.include?(s - 2) && !seat_ids.include?(s - 1)
        return s + 1 if seat_ids.include?(s + 2) && !seat_ids.include?(s + 1)
      end
    end
  end
end
