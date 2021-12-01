require "byebug"

module Year2020
  class Day03
#     ..##.......
#     #...#...#..
#     .#....#..#.
#     ..#.#...#.#
#     .#...##..#.
#     ..#.##.....
#     .#.#.#....#
#     .#........#
#     #.##...#...
#     #...##....#
#     .#..#...#.#
    def part1(input)
      landscape = input.map(&:chars)

      down = 1
      right = 3
      trees = 0

      index = 0
      0.step(landscape.size - 1, down) do |depth|
        trees += 1 if has_tree?(landscape[depth], depth, right, index)
        index += 1
      end
      trees
    end

    def part2(input)
      landscape = input.map(&:chars)

      slopes = [
        [1, 1],
        [3, 1],
        [5, 1],
        [7, 1],
        [1, 2],
      ]

      all_trees = []

      slopes.each do |right, down|
        trees = 0
        index = 0
        0.step(landscape.size - 1, down) do |depth|
          trees += 1 if has_tree?(landscape[depth], depth, right, index)
          index += 1
        end
        all_trees << trees
      end

      puts
      puts all_trees.inspect
      puts
      all_trees.reduce(&:*)
    end

    def has_tree?(row, depth, right, i)
      index = i * right

      index = index % row.size
      row[index] == "#"
    end
  end
end
