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

        # seed-to-soil map:
        # dest source range-length
        # 50 98 2
        # 52 50 48

        found = false
        # puts
        # puts format("Section: %s", section)
        map[section].each do |ranges|
          next if found

          destination, source, length = ranges
          upper_source_range = source + length - 1

          # puts format("current_location: %s, destination: %s, source: %s, length: %s, source range: %s - %s", location, destination, source, length, source, upper_source_range)

          # 98, 99
          # 50, 51     50
          # if seed >= 98 && seed <= 99
          #   return destination + seed - 50
          if location >= source && location <= upper_source_range
            found = true

            offset = location - source

            # puts
            # puts format("location (%s) found in range: %s - %s", location, source, upper_source_range)
            # puts format("location - source: %s - %s = %s", location, source, offset)
            # puts format("destination + offset: %s + %s = %s", destination, offset, destination + offset)
            location = destination + offset
            # puts format("Mapped location to new location => %s", location)
            # puts
          end
        end
      end

      location
    end

    def part1(input)
      map = parse_input(input)
      locations = map["seeds"].map do |seed|
        find_location(seed:, map:)
      end.min
    end
  end
end
