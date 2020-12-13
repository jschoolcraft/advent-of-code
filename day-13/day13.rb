require "byebug"

module Year2020
  class Day13
    def part1(input)
      start_time = input.shift.to_i
      bus_ids = input.shift.split(/,/).reject { |i| i == "x" }.map(&:to_i).sort

      # puts format("start_time: %s, bus_ids: %s", start_time, bus_ids.inspect)

      product = 0
      start_time.upto(start_time + bus_ids.first) do |i|
        departing = bus_ids.select { |b| i % b == 0 }
        if departing.any?
          bus_id = departing.first
          product = (i - start_time) * bus_id
          # puts format("time: %s, bus: %s, product: %s", i, bus_id, product)
          break
        end
      end
      product
    end

    def part2(input)
      puts
      bus_ids = input.last.split(/,/)

      puts format("bus_ids: %s", bus_ids.inspect)

      bus_offsets = []
      bus_ids.each_with_index do |b, i|
        next if b.to_i == 0

        bus_offsets << [i, b.to_i]
      end
      # bus_offsets.shift
      puts format("bus_offsets: %s", bus_offsets.inspect)

      n = bus_offsets.map(&:last).reduce(:*)
      puts format("N: %s", n)

      ns = []
      0.upto(bus_offsets.size - 1) do |i|
        f = bus_offsets.select { |b| bus_offsets.index(b) != i }.map(&:last)
        puts format("i: %s, rest: %s", i, f.inspect)
        ns << f.reduce(:*)
      end
      puts format("Ns: %s", ns.inspect)

      xs = []
      ns.each_with_index do |n, i|
        x = n % bus_offsets[i].last
        y = solve(x, 1, bus_offsets[i].last)
        xs << y
      end
      puts format("Xs: %s", xs.inspect)

      xnbs = []
      0.upto(xs.size - 1) do |i|
        puts format("%s * %s * %s", ns[i], xs[i], bus_offsets[i].first)
        foo = ns[i] * xs[i] * bus_offsets[i].first
        puts format("foo: %s", foo)
        xnbs << ns[i] * xs[i] * bus_offsets[i].first
      end
      puts format("Xbns: %s", xnbs.inspect)
      x = xnbs.sum
      puts x
      puts format("x mod n: %s", x % n)
      x % n
      # solve(1, x % n, n)
    end

    def solve(x, y, z)
      puts format("x: %s, y: %s, z: %s", x, y, z)
      i = 0
      loop do
        i += 1
        return i if (x * i) % z == y
      end
    end
  end
end
