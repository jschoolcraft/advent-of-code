require "byebug"

module Year2020
  class Day13
    def part1(input)
      start_time = input.shift.to_i
      bus_ids = input.shift.split(/,/).reject { |i| i == "x" }.map(&:to_i).sort


      product = 0
      start_time.upto(start_time + bus_ids.first) do |i|
        departing = bus_ids.select { |b| i % b == 0 }
        if departing.any?
          bus_id = departing.first
          product = (i - start_time) * bus_id
          break
        end
      end
      product
    end

    def extended_gcd(a, b)
      last_remainder, remainder = a.abs, b.abs
      x, last_x, y, last_y = 0, 1, 1, 0
      while remainder != 0
        last_remainder, (quotient, remainder) = remainder, last_remainder.divmod(remainder)
        x, last_x = last_x - quotient * x, x
        y, last_y = last_y - quotient * y, y
      end
      return last_remainder, last_x * (a < 0 ? -1 : 1)
    end

    def invmod(e, et)
      g, x = extended_gcd(e, et)
      raise 'Multiplicative inverse modulo does not exist!' if g != 1
      x % et
    end

    def part2(input)
      # stolen from https://rosettacode.org/wiki/Chinese_remainder_theorem#Ruby
      # after getting a hint that this actually uses the Chinese remainder theorem
      bus_ids = input.last.split(/,/).map { |b| b.to_i if b.to_i != 0 }

      foo = bus_ids.each.with_index.map { |b, i| [b, (i * -1) % b] if !b.nil? }.reject { |s| s.nil? }

      max = foo.map(&:first).reduce(:*)
      series = foo.map do |m, r|
        r * max * invmod(max / m, m) / m
      end
      series.sum % max
    end
  end
end
