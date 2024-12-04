require "byebug"

module Year2023
  class Day06
    def part1(input)
      times = input.first.scan(/\d+/).map(&:to_i)
      distances = input.last.scan(/\d+/).map(&:to_i)

      winners = times.map do |time|
        (1..time).map do |t|
          # puts t
          button = t
          traveling = time - t
          # puts format("button: %s, traveling: %s, %s * %s = %s", button, traveling, button, traveling, button * traveling)
          button * traveling
        end.select { |d| d > distances[times.index(time)] }.size
      end
      winners.reduce(:*)
    end

    def part2(input)
      time = input.first.split(/:/).last.gsub(/\s+/, '').to_i
      distance = input.last.split(/:/).last.gsub(/\s+/, '').to_i

      distances = (1..time).map do |t|
        # puts t
        button = t
        traveling = time - t
        # puts format("button: %s, traveling: %s, %s * %s = %s", button, traveling, button, traveling, button * traveling)
        button * traveling
      end

      distances.select { |d| d > distance }.size
    end
  end
end
