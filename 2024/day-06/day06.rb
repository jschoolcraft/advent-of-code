require "byebug"

module Year2024
  class Day06
    def part1(input)
      positions = []

      grid = input.map { |line| line.strip.chars }

      row, col = find_starting_position(grid, "^")
      positions << [row, col]
      current_direction = :up

      loop do
        n = next_space(grid, row, col, current_direction)

        case n
        when "#"
          current_direction = change_direction(current_direction, :right)
        when ".", "^"
          row, col = case current_direction
                     when :up
                       [row - 1, col]
                     when :down
                       [row + 1, col]
                     when :left
                       [row, col - 1]
                     when :right
                       [row, col + 1]
                     end
          positions << [row, col]
        when "*"
          break
        else
          puts "Unknown character: #{n}"
          break
        end
      end

      # pp positions
      positions.uniq.count
    end

    def part2(input)
      4242
    end

    def find_starting_position(grid, char)
      t = grid.select { |row| row.include?(char) }.first
      row = grid.index(t)
      col = t.index(char)

      [row, col]
    end

    def next_space(grid, row, col, direction)
      case direction
      when :up
        row -= 1
      when :down
        row += 1
      when :left
        col -= 1
      when :right
        col += 1
      end

      if row < 0 || col < 0 || row >= grid.size || col >= grid.first.size
        "*" # exit
      else
        grid[row][col]
      end
    end

    def change_direction(current_direction, turn)
      case current_direction
      when :up
        turn == :right ? :right : :left
      when :down
        turn == :right ? :left : :right
      when :left
        turn == :right ? :up : :down
      when :right
        turn == :right ? :down : :up
      end
    end
  end
end
