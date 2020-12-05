require "byebug"

module Year2020
  class Day05
    def row_number(pass, rows: 128)
      upper = rows - 1
      lower = 0
      middle = (upper - lower)/ 2

      pass.chars.first(7).each_with_index do |c|
        middle = ((upper - lower * 1.0)/ 2).ceil
        if c == "F"
          upper -= middle
        else
          lower += middle
        end
        # puts format("%s -> lower: %s, upper: %s, middle: %s", c, lower, upper, middle)
      end
      lower
    end

    def column_number(pass, rows: 8)
      right = rows - 1
      left = 0
      middle = (right - left)/ 2

      pass.chars.last(3).each_with_index do |c|
        middle = ((right - left * 1.0)/ 2).ceil
        if c == "L"
          right -= middle
        else
          left += middle
        end
        # puts format("%s -> left: %s, right: %s, middle: %s", c, left, right, middle)
      end
      left
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
