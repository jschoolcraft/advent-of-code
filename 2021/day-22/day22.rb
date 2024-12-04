require "byebug"

class Integer
  N_BYTES = [42].pack('i').size
  N_BITS = N_BYTES * 16
  MAX = 2 ** (N_BITS - 2) - 1
  MIN = -MAX - 1
end

module Year2021
  class Day22
    def part1(input, upper: Integer::MAX, lower: Integer::MIN)
      puts
      puts
      on = []
      input.each do |line|
        direction, ranges = line.split(/ /)

        out_of_range = false
        xr, yr, zr = ranges.split(/,/).map do |range|
          min, max = range
                        .split(/=/)
                        .last
                        .split(/\.+/)
                        .map(&:to_i)

          out_of_range = true if [min, max].max < lower || [min, max].min > upper

          [min.clamp(lower, upper), max.clamp(lower, upper)]
        end

        if out_of_range
          puts format("Skipping: %s", line)
          next
        end

        puts format("%s: xr: %s, yr: %s, zr: %s", direction, xr, yr, zr)

        xr.first.upto(xr.last) do |x|
          yr.first.upto(yr.last) do |y|
            zr.first.upto(zr.last) do |z|
              if direction == "on"
                on << [x, y, z]
              else
                on.delete([x, y, z])
              end
            end
          end
        end
        puts format("turned on: %s", on.size)
      end
      on.uniq.size
    end

    def part2(input)
      4242
    end
  end
end
