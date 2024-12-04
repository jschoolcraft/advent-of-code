require "byebug"

module Year2023
  class Day05

    SECTIONS = %w[
      seed-to-soil
      soil-to-fertilizer
      fertilizer-to-water
      water-to-light
      light-to-temperature
      temperature-to-humidity
      humidity-to-location
    ]

    def parse_input(input)
      parsed = Hash.new { |h, k| h[k] = [] }

      # pull off seeds first
      parsed["seeds"] = input.shift.split(/:/).last.strip.scan(/\d+/).map(&:to_i)
      input.shift

      section = 0
      input.each do |line|
        if line.empty?
          section += 1
          next
        end

        next if line.index(SECTIONS[section])

        parsed[SECTIONS[section]] << line.scan(/\d+/).map(&:to_i)
      end

      parsed
    end

    def find_location(seed:, map:, section: nil)
      # if section is nil we'll return the final location, location
      section_limit = section.nil? ? SECTIONS.size - 1 : SECTIONS.index(section)

      location = seed
      0.upto(section_limit) do |section_index|
        section = SECTIONS[section_index]

        candidate = map[section].select do |destination, source, length|
          upper_source_range = source + length - 1
          location >= source && location <= upper_source_range
        end.first

        next if candidate.nil?

        destination, source, length = candidate
        offset = location - source
        location = destination + offset

        #  # seed-to-soil map:
        #  # dest source range-length
        #  # 50 98 2
        #  # 52 50 48

        #  found = false
        #  # puts
        #  # puts format("Section: %s", section)
        #  map[section].each do |ranges|
        #    next if found

        #    destination, source, length = ranges
        #    upper_source_range = source + length - 1

        #    # puts format("current_location: %s, destination: %s, source: %s, length: %s, source range: %s - %s", location, destination, source, length, source, upper_source_range)

        #    # 98, 99
        #    # 50, 51     50
        #    # if seed >= 98 && seed <= 99
        #    #   return destination + seed - 50
        #    if location >= source && location <= upper_source_range
        #      found = true

        #      offset = location - source

        #      # puts
        #      # puts format("location (%s) found in range: %s - %s", location, source, upper_source_range)
        #      # puts format("location - source: %s - %s = %s", location, source, offset)
        #      # puts format("destination + offset: %s + %s = %s", destination, offset, destination + offset)
        #      location = destination + offset
        #      # puts format("Mapped location to new location => %s", location)
        #      # puts
        #    end
        #  end
      end

      location
    end

    def all_seeds(seed_pairs)
      seeds = []

      seed_pairs.each_slice(2) do |start, count|
        0.upto(count - 1) { |i| seeds << start + i }
      end

      seeds
    end

    # def part2(input)
    #   map = parse_input(input)
    #   location = Float::INFINITY

    #   map["seeds"].each_slice(2) do |start, count|
    #     0.upto(count - 1) do |i|
    #       seed = start + i
    #       loc = find_location(seed:, map:)
    #       location = loc if loc < location
    #     end
    #   end
    #   location
    # end

    def part2(input)
      map = parse_input(input)
      location = Float::INFINITY

      section_limit = SECTIONS.size - 1

      map["seeds"].each_slice(2) do |start, count|
        puts format("%s - Range: %s..%s", Time.now, start, start + count - 1)
        range_locations = (start..(start + count - 1)).map do |seed|

          loc = seed
          0.upto(section_limit) do |section_index|
            section = SECTIONS[section_index]

            candidate = map[section].select do |destination, source, length|
              upper_source_range = source + length - 1
              loc >= source && loc <= upper_source_range
            end.first

            next if candidate.nil?

            destination, source, length = candidate
            offset = loc - source
            loc = destination + offset
          end
          loc

        end

        # pp range_locations
        location = range_locations.min if range_locations.min < location
      end

      location
    end
  end
end


input = <<~EOF
seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4
EOF

input = File.read("./input.txt").split(/\n/)
puts format("Solution: %s", Year2023::Day05.new.part2(input))
