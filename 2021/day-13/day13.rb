require "byebug"

module Year2021
  class Day13
    def fold(dots, direction, magnitude)
      if direction == "y"
        dots.map do |x, y|
          if y < magnitude
            [x, y]
          else
            byebug if y == magnitude
            [x, magnitude - (y - magnitude)]
          end
        end
      else
        dots.map do |x, y|
          if x < magnitude
            [x, y]
          else
            byebug if x == magnitude
            [magnitude - (x - magnitude), y]
          end
        end
      end
    end

    def print(dots)
      dots.map!(&:reverse)
      puts
      rows = []
      0.upto(dots.map(&:first).max) do |i|
        rows << dots.select { |x,y| x == i }.map(&:last).uniq.sort
      end
      height = rows.size
      width = rows.map(&:max).max

      rows.each do |row|
        display = Array.new(width, ".")
        row.each { |pos| display[pos] = "#" }
        puts display.join(" ")
      end
      puts
    end

    def part1(input)
      dots = input.reject { |i| i =~ /fold along/ }
                  .map { |i| i.split(/,/).map(&:to_i) }
                  .reject(&:empty?)
                  .reject { |e| e.size == 1 }

      folds = input.select { |i| i =~ /fold along/ }.map do |f|
        f.split.last.split(/=/)
      end.map { |f| [f.first, f.last.to_i] }

      direction, magnitude = folds.first
      dots = fold(dots, direction, magnitude)

      dots.uniq.size
    end

    def part2(input)
      dots = input.reject { |i| i =~ /fold along/ }
                  .map { |i| i.split(/,/).map(&:to_i) }
                  .reject(&:empty?)
                  .reject { |e| e.size == 1 }
      # p dots

      folds = input.select { |i| i =~ /fold along/ }.map do |f|
        f.split.last.split(/=/)
      end.map { |f| [f.first, f.last.to_i] }
      # p folds

      # p dots
      folds.each do |direction, magnitude|
        dots = fold(dots, direction, magnitude)
      end
      print dots
    end
  end
end
