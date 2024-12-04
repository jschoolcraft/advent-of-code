require "byebug"
require_relative "./graph"

module Year2021
  class Day12
    def part1(input)
      edges = input.map { |i| i.split(/\-/) }
      dg = Graph.new(edges.flatten.uniq)
      edges.each { |start, finish| dg.add_edge(start, finish) }

      byebug
    end

    def part2(input)
      4242
    end
  end
end
