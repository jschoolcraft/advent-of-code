require "byebug"

module Year2024
  class Day06
    def part1(input)
      positions = path(input)
      positions.uniq.count
    end

    def part2(input)
      guard_path = path(input)

      positions = []
      loops = 0

      grid = input.map { |line| line.strip.chars }

      0.upto(grid.size - 1) do |i|
        0.upto(grid.first.size - 1) do |j|
          # only interested in open spaces
          next unless grid[i][j] == "."

          # only interested in spaces on the guard path
          next unless guard_path.map { |r,c| [i, j] == [r, c] }.any?

          og = input.map { |line| line.strip.chars }
          og[i][j] = "#"

          # pp og

          row, col = find_starting_position(og, "^")
          current_direction = :up
          positions << [row, col, current_direction]

          moves = 0
          looping = []

          loop do
            moves += 1
            n = next_space(og, row, col, current_direction)

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

              if positions.include?([row, col, current_direction])
                looping << [row, col, current_direction]
                # pp looping

                if looping.tally.values.include?(2)
                  # pp looping
                  if looping.map { |l| positions.include?(l) }.all?
                    # puts "Looping!"
                    loops += 1
                    break
                  end
                end
              else
                looping = []
              end

              positions << [row, col, current_direction]
            when "*"
              break
            else
              puts "Unknown character: #{n}"
              break
            end


            if moves > 100000
              puts "maybe too many moves?"
              loops += 1
              break
            end


            # pp positions
          end
        end
      end
      loops
    end

    def path(input)
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

      positions
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
