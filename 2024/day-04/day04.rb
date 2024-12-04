require "byebug"

module Year2024
  class Day04
    def part1(input)
      # puts input.inspect
      xmas = 0

      term = "XMAS"

      # horizontal
      xmas += input.map { |line| line.scan(term) }.flatten.count
      xmas += input.map { |line| line.scan(term.reverse) }.flatten.count

      # vertical
      xmas += input.map(&:chars).transpose.map(&:join).map { |line| line.scan(term) }.flatten.count
      xmas += input.map(&:chars).transpose.map(&:join).map { |line| line.scan(term.reverse) }.flatten.count

      # diagonal
      diagonals = find_diagonal(input, "XMAS").size
      xmas += diagonals
    end

    def part2(input)
      starting_coords = find_diagonal(input, "MAS")
      find_xs(starting_coords)
    end

    def find_diagonal(input, term)
      starting_coords = []

      grid = input.map(&:chars)

      height = grid.size
      width = grid.first.size

      chars = term.chars
      starting_char = chars.shift

      (0..height - 1).each do |y|
        (0..width - 1).each do |x|
          next unless grid[y][x] == starting_char

          # Top to Bottom, Left to right
          if y + chars.size < height && x + chars.size < width
            match = true
            chars.each_with_index do |char, i|
              if grid[y + i + 1][x + i + 1] != char
                match = false
                break
              end
            end
            starting_coords << [[x, y], [x + chars.size, y + chars.size]] if match
          end

          # Top to Bottom, Right to left
          if y + chars.size < height && x - chars.size >= 0
            match = true
            chars.each_with_index do |char, i|
              if grid[y + i + 1][x - i - 1] != char
                match = false
                break
              end
            end
            starting_coords << [[x, y], [x - chars.size, y + chars.size]] if match
          end

          # Bottom to Top, Left to right
          if y - chars.size >= 0 && x + chars.size < width
            match = true
            chars.each_with_index do |char, i|
              if grid[y - i - 1][x + i + 1] != char
                match = false
                break
              end
            end
            starting_coords << [[x, y], [x + chars.size, y - chars.size]] if match
          end

          # Bottom to Top, Right to left
          if y - chars.size >= 0 && x - chars.size >= 0
            match = true
            chars.each_with_index do |char, i|
              if grid[y - i - 1][x - i - 1] != char
                match = false
                break
              end
            end
            starting_coords << [[x, y], [x - chars.size, y - chars.size]] if match
          end
        end
      end
      starting_coords
    end

    def find_xs(input)
      foo = input.dup
      xs = 0

      input.each do |coords|
        start,finish = coords
        # puts "checking #{coords.inspect}"
        if foo.delete([[start.first, finish.last], [finish.first, start.last]])
          foo.delete(coords)
          # puts "found box #{[[start.first, finish.last], [finish.first, start.last]]}"
          xs += 1
          next
        end

        if foo.delete([[finish.first, start.last], [start.first, finish.last]])
          foo.delete(coords)
          # puts "found box #{[[finish.first, start.last], [start.first, finish.last]]}"
          xs += 1
          next
        end
      end

      xs
    end
  end
end
