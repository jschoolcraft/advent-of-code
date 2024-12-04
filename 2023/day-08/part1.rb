require "byebug"

module Year2023
  class Node
    attr_reader :name, :left, :right

    def initialize(string)
      @name, instructions = string.split(" = ").map(&:strip)
      @left, @right = instructions.scan(/\w+/)
    end

    def to_s
      format("%s: (%s, %s)", name, left, right)
    end
  end

  class Day08
    def part1(input)
      # p input.inspect
      lines = input.split(/\n/)

      # pull off directions
      directions = lines.shift.chars.compact
      # puts format("Directions: %s", directions.join(""))

      # pull off blank line
      lines.shift

      nodes = lines.map { |line| Node.new(line) }

      iterations = 0
      current = nodes.find { |node| node.name == "AAA" }
      while current.name != "ZZZ" && iterations < 100000
        # puts format("%s: %s", iterations, current)
        directions.each do |direction|
          iterations += 1
          next_node = if direction == "L"
                        current.left
                      elsif direction == "R"
                        current.right
                      else
                        raise "Unknown direction: #{direction}"
                      end
          # puts format("  %s: %s", direction, next_node)

          current = nodes.find { |node| node.name == next_node}
        end
      end
      iterations
    end

    def part2(input)
      lines = input.split(/\n/)

      # pull off directions
      directions = lines.shift.chars.compact
      # puts format("Directions: %s", directions.join(""))

      # pull off blank line
      lines.shift

      nodes = lines.map { |line| Node.new(line) }

      starting_nodes = nodes.select { |node| node.name.chars.last == "A" }
      counts = starting_nodes.map do |current|
        iterations = 0
        while current.name.chars.last != "Z" && iterations < 100000
          # puts format("%s: %s", iterations, current)
          directions.each do |direction|
            iterations += 1
            next_node = if direction == "L"
                          current.left
                        elsif direction == "R"
                          current.right
                        else
                          raise "Unknown direction: #{direction}"
                        end
            # puts format("  %s: %s", direction, next_node)

            current = nodes.find { |node| node.name == next_node}
          end
        end
        iterations
      end
      puts format("Counts: %s", counts.join(", "))
      counts.reduce(1, :lcm)
    end
  end
end

puts Year2023::Day08.new.part2(File.read("./input.txt"))
