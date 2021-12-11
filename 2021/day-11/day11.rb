require "byebug"
require "ostruct"

module Year2021
  class Day11
    def setup_grid(input)
      input.map do |row|
        row.chars.map(&:to_i).map do |val|
          OpenStruct.new(
            energy: val,
            flashed: false,
            flashes: 0,
          )
        end
      end
    end

    def print_grid(grid, type: :energy, new_lines: true)
      puts if new_lines
      grid.each do |row|
        case type
        when :energy
          puts row.map(&:energy).join
        when :flashed
          puts row.map(&:flashed).join
        when :flashes
          puts row.map(&:flashes).join
        end
      end
      puts if new_lines
    end

    def increase_energy(grid)
      grid.map do |row|
        row.map do |octo|
          octo.energy += 1
          octo
        end
      end
    end

    def reset_grid(grid)
      raise "WOW" if grid.map { |r| r.map(&:flashed) }.flatten.all?

      grid.map do |row|
        row.map do |octo|
          if octo.flashed
            octo.energy = 0
            octo.flashed = false
            octo.flashes += 1
          end
          octo
        end
      end
    end

    def flash(grid, times: 0)
      more_to_flash = grid.map { |row| row.map { |octo| octo.energy > 9  && !octo.flashed } }.flatten.any?
      return reset_grid(grid) unless more_to_flash

      # raise "foo" if times > 10

      # print_grid(grid)

      row_max = grid.size - 1
      col_max = grid.first.size - 1

      0.upto(grid.size - 1) do |row|
        0.upto(grid.first.size - 1) do |col|
          octo = grid[row][col]
          next unless !octo.flashed && octo.energy > 9

          if row != 0
            grid[row - 1][col - 1].energy += 1 unless col.zero?
            grid[row - 1][col].energy += 1
            grid[row - 1][col + 1].energy += 1 unless col == col_max
          end

          grid[row][col - 1].energy += 1 unless col.zero?
          grid[row][col + 1].energy += 1 unless col == col_max

          if row != row_max
            grid[row + 1][col - 1].energy += 1 unless col.zero?
            grid[row + 1][col].energy += 1
            grid[row + 1][col + 1].energy += 1 unless col == col_max
          end
          grid[row][col].flashed = true
        end
      end

      flash(grid, times: times + 1)
    end

    def process_step(grid)
      flash(increase_energy(grid))
    end

    def part1(input, steps: 100)
      grid = setup_grid(input)
      # print_grid(grid)
      0.upto(steps - 1) do
        grid = process_step(grid)
        # grid = flash(grid)
        # print_grid(grid)
      end
      grid.map { |rows| rows.map(&:flashes) }.flatten.sum
    end

    # There's probably a nicer way to do this that doesn't rely
    # on exceptions for control flow but I was frustrated with
    # the dumb mistakes I was making like (> 9 and not >= 9).
    #
    # My guess is maybe returning two values from
    # `process_step` something like [grid, all_flashed?]
    #
    # The input also could have made the `raise` version unworkable if they
    # all flashed before getting to step 100
    def part2(input)
      grid = setup_grid(input)
      step = 0

      loop do
        grid = process_step(grid)
        grid = flash(grid)
        step += 1
      rescue
        break
      end
      step + 1
    end
  end
end
