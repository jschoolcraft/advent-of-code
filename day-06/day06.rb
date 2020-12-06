require "byebug"
require "set"

module Year2020
  class Day06
    def group_input(input)
      groups = []
      group = []
      input.each do |q|
        if q.strip == ""
          groups << group
          group = []
        else
          group << q
        end
      end
      groups << group
      groups
    end

    def part1(input)
      groups = group_input(input)
      groups.each do |g|
        # puts g.flatten.join.chars.uniq.inspect
      end

      yes = groups.map { |g| g.flatten.join.chars.uniq.size }
      # puts yes.inspect
      yes.sum
    end

    def part2(input)
      groups = group_input(input)
      yes = groups.map do |g|
        # puts
        # puts format("g: %s", g.inspect)
        if g.size == 1
          # puts format("one set, yes answers: %s", g.first.chars.size)
          g.first.chars.size
        else
          # puts "figure shit out"
          longest = g.sort { |a, b| a.chars.size <=> b.chars.size }.last
          # puts longest
          yeses = []
          longest.chars.each do |c|
            yeses << c if g.map { |q| q.include? c }.all?
          end
          # puts yeses.inspect
          yeses.size
        end
      end
      # puts yes.inspect
      yes.sum
    end
  end
end
