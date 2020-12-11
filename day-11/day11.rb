require "byebug"

module Year2020
  class Day11
    def part1(input)
      seats = input.map(&:chars)

      # print_seats(seats)

      previous = seats.dup
      current = seats.dup

      begin
        previous = current
        current = churn(current)
        # print_seats(current)
      end until previous == current

      # print_seats(current)

      current.map { |r| r.select { |seat| seat == "#" }.size }.sum
    end

    def print_seats(seats)
      puts
      0.upto(seats.size - 1) do |row|
        puts seats[row].inspect
      end
    end

    def churn(seats, max_occupied = 4)
      updated = []

      max_rows = seats.size - 1
      max_cols = seats.first.size - 1

      0.upto(max_rows) do |row|
        new_row = []
        0.upto(max_cols) do |col|
          current = seats[row][col]
          if  current == "."
            new_row << current
          else
            neighbors = find_neighbors(seats, row, col)
            if current == "L" && neighbors.select { |seat| seat == "#" }.size == 0
              # becomes occupied
              new_row << "#"
            elsif current == "#" && neighbors.select { |seat| seat == "#"}.size >= max_occupied
              # becomes empty
              new_row << "L"
            else
              new_row << current
            end
          end
        end
        updated << new_row
      end
      updated
    end

    def churn2(seats, max_occupied = 5)
      updated = []

      max_rows = seats.size - 1
      max_cols = seats.first.size - 1

      0.upto(max_rows) do |row|
        new_row = []
        0.upto(max_cols) do |col|
          current = seats[row][col]
          if  current == "."
            new_row << current
          else
            neighbors = find_visible_neighbors(seats, row, col)
            if current == "L" && neighbors.select { |seat| seat == "#" }.size == 0
              # becomes occupied
              new_row << "#"
            elsif current == "#" && neighbors.select { |seat| seat == "#"}.size >= max_occupied
              # becomes empty
              new_row << "L"
            else
              new_row << current
            end
          end
        end
        updated << new_row
      end
      updated
    end

    def find_neighbors(seats, row, col)
      max_rows = seats.size - 1
      max_cols = seats.first.size - 1

      adjacent = []

      [-1, 0, 1].each do |r|
        [-1, 0, 1].each do |c|
          next if r == 0 && c == 0

          adjacent << [row + r, col + c]
        end
      end

      adjacent.select! do |r, c|
        in_bounds?(r, c, max_rows, max_cols)
      end

      neighbors = []
      adjacent.each do |r, c|
        neighbors << seats[r][c]
      end

      neighbors
    end

    def find_visible_neighbors(seats, row, col)
      max_rows = seats.size - 1
      max_cols = seats.first.size - 1

      neighbors = []

      [-1, 0, 1].each do |r|
        [-1, 0, 1].each do |c|
          next if r == 0 && c == 0

          # find first seat in direction of +r and +c
          c_row = row + r
          c_col = col + c

          while in_bounds?(c_row, c_col, max_rows, max_cols) && seats[c_row][c_col] == "." do
            c_row = c_row + r
            c_col = c_col + c
          end

          neighbors << seats[c_row][c_col] if in_bounds?(c_row, c_col, max_rows, max_cols)
        end
      end

      neighbors.compact
    end

    def in_bounds?(row, col, max_row, max_col)
      row >= 0 && row <= max_row &&
        col >= 0 && col <= max_col
    end

    def part2(input)
      seats = input.map(&:chars)

      # print_seats(seats)

      previous = seats.dup
      current = seats.dup

      begin
        previous = current
        current = churn2(current)
        # print_seats(current)
      end until previous == current

      # print_seats(current)

      current.map { |r| r.select { |seat| seat == "#" }.size }.sum
    end
  end
end
