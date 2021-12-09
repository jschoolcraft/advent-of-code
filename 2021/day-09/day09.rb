require "byebug"

module Year2021
  class Day09
    def lower_than_adjacent(heights, row, col)
      adjacents = []
      adjacents << heights[row - 1][col] unless row.zero?
      adjacents << heights[row + 1][col] unless row == heights.size - 1
      adjacents << heights[row][col - 1] unless col.zero?
      adjacents << heights[row][col + 1] unless col == heights.first.size - 1

      adjacents.all? { |a| a > heights[row][col] }
    end

    def part1(input)
      low_points = []
      heights = input.map { |i| i.chars.map(&:to_i) }
      # p heights

      0.upto(heights.size - 1) do |x|
        0.upto(heights.first.size - 1) do |y|
          low_points << heights[x][y] if lower_than_adjacent(heights, x, y)
        end
      end

      low_points.map { |l| l + 1 }.sum
    end

    def find_basin_points(heights, row, col, points: [])
      return points if heights[row][col] == 9

      points << [row, col]
      find_basin_points(heights, row - 1, col, points: points) unless points.include?([row - 1, col]) || row.zero?
      find_basin_points(heights, row + 1, col, points: points) unless points.include?([row + 1, col]) || row == heights.size - 1
      find_basin_points(heights, row, col - 1, points: points) unless points.include?([row, col - 1]) || col.zero?
      find_basin_points(heights, row, col + 1, points: points) unless points.include?([row, col + 1]) || col == heights.first.size - 1
      return points
    end

    def part2(input)
      low_points = []
      heights = input.map { |i| i.chars.map(&:to_i) }

      0.upto(heights.size - 1) do |x|
        0.upto(heights.first.size - 1) do |y|
          low_points << [x, y] if lower_than_adjacent(heights, x, y)
        end
      end

      sizes = []
      low_points.each do |x, y|
        sizes << find_basin_points(heights, x, y).size
      end
      sizes.sort.last(3).reduce(:*)
    end
  end
end
