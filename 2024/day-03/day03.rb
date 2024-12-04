require "byebug"

module Year2024
  class Day03
    def part1(input)
      re = /mul\(\d{1,3},\d{1,3}\)/
      results = input.scan(re).map { |i| i.gsub(/mul\(/, '').gsub(/\)/,'').split(/,/).map(&:to_i) }
      results.map { |i| i.reduce(:*) }.reduce(:+)
    end

    def part2(input)
      status = :enabled
      instructions = ""

      while(input.length > 0)
        puts format("input size: %d", input.length)
        if status == :enabled
          index = input.index("don't()")
          unless index
            instructions += input
            input = ""
          else
            foo = input.slice(0...index)
            instructions += foo
            input.gsub!(foo + "don't()", '')
          end
          status = :disabled
        else
          index = input.index("do()")
          unless index
            input = ""
          else
            foo = input.slice(0...index)
            input.gsub!(foo + "do()", '')
          end
          status = :enabled
        end
      end

      re = /mul\(\d{1,3},\d{1,3}\)/
      results = instructions.scan(re).map { |i| i.gsub(/mul\(/, '').gsub(/\)/,'').split(/,/).map(&:to_i) }
      puts results.inspect
      results.map { |i| i.reduce(:*) }.reduce(:+)
    end
  end
end
