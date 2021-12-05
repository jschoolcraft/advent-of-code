require "byebug"

module Year2021
  class Day05
    def is_diagonal?(x1, y1, x2, y2)
      return true if x1 == x2 && y1 == y2

      (x2 - x1).abs == (y2 - y1).abs
    end

    def line_points(x1, y1, x2, y2)
      if x1 == x2
        y1, y2 = [y1, y2].sort
        y1.upto(y2).map { |y| [x1, y] }
      else
        x1, x2 = [x1, x2].sort
        x1.upto(x2).map { |x| [x, y1] }
      end
    end

    def diagonal_points(x1, y1, x2, y2)
      xs = nil
      ys = nil
      if x1 < x2 && y1 < y2
        xs = x1.upto(x2).to_a
        ys = y1.upto(y2).to_a
      elsif x1 < x2 && y1 > y2
        xs = x1.upto(x2).to_a
        ys = y1.downto(y2).to_a
      elsif x1 > x2 && y1 < y2
        xs = x1.downto(x2).to_a
        ys = y1.upto(y2).to_a
      else
        xs = x1.downto(x2).to_a
        ys = y1.downto(y2).to_a
      end
      xs.zip(ys)
    end

    def part1(input)
      lines = Hash.new { |h, k| h[k] = 0 }

      input.each do |line|
        p1, p2 = line.strip.split(/ -> /)
        x1, y1 = p1.split(/,/).map(&:to_i)
        x2, y2 = p2.split(/,/).map(&:to_i)

        next if is_diagonal?(x1, y1, x2, y2)
        next unless x1 == x2 || y1 == y2

        line_points(x1, y1, x2, y2).each do |x, y|
          lines[format("%s,%s", x, y)] += 1
        end
      end
      lines.select { |_, v| v >= 2 }.keys.size
    end

    def part2(input)
      lines = Hash.new { |h, k| h[k] = 0 }

      input.each do |line|
        p1, p2 = line.strip.split(/ -> /)
        x1, y1 = p1.split(/,/).map(&:to_i)
        x2, y2 = p2.split(/,/).map(&:to_i)

        if is_diagonal?(x1, y1, x2, y2)
          diagonal_points(x1, y1, x2, y2).each do |x, y|
            lines[format("%s,%s", x, y)] += 1
          end
        elsif x1 == x2
          line_points(x1, y1, x2, y2).each do |x, y|
            lines[format("%s,%s", x, y)] += 1
          end
        elsif y1 == y2
          line_points(x1, y1, x2, y2).each do |x, y|
            lines[format("%s,%s", x, y)] += 1
          end
        end
      end

      lines.select { |_, v| v >= 2 }.keys.size
    end
  end
end
