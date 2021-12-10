require "byebug"

module Year2021
  class Day10
    def closes(open, close)
      closers = {
        '(': ')',
        '[': ']',
        '{': '}',
        '<': '>',
      }
      closers[open.to_sym] == close
    end

    def score(errors)
      points = {
        ')': 3,
        ']': 57,
        '}': 1197,
        '>': 25137,
      }
      errors.map { |e| points[e.to_sym] }.sum
    end

    def part1(input)
      errors = []

      input.each do |line|
        parse = []
        found_error = false
        # puts format("line: %s", line.chars)
        line.chars.each do |char|
          # puts format("char: %s", char)
          next if found_error

          # puts format("parse: %s", parse)
          # puts format("errors: %s", errors)

          if ['(', '[', '{', '<'].include?(char)
            parse << char
          elsif closes(parse.last, char)
            parse.pop
          else
            errors << char
            found_error = true
          end
        end
      end
      score(errors)
    end

    def part2(input)
    end
  end
end
