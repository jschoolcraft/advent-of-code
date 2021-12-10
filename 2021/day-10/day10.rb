require "byebug"

module Year2021
  class Day10
    CLOSERS = {
      '(': ')',
      '[': ']',
      '{': '}',
      '<': '>',
    }.freeze

    def closes(open, close)
      # puts format("open: %s, closes: %s", open, close)
      return false if open.nil? || close.nil?
      return false unless CLOSERS.keys.include?(open.to_sym)

      CLOSERS[open.to_sym] == close
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

    def parse_line(line)
      errors = []
      parsed = []
      found_error = false
      # puts format("line: %s", line.chars)
      line.chars.each do |char|
        # puts format("char: %s", char)
        next if found_error

        if ['(', '[', '{', '<'].include?(char)
          parsed << char
        elsif closes(parsed.last, char)
          parsed.pop
        else
          errors << char
          found_error = true
        end
      end
      [parsed, errors]
    end

    def close_line(chars, closers = [], pending = [])
      # puts format("chars: %s, pending: %s, closers: %s", chars.join, pending, closers.join)
      return closers if chars.size.zero?

      if closes(chars[-2], chars[-1])
        chars.pop
        chars.pop
      elsif closes(chars.last, pending.first)
        chars.pop
        pending.shift
      elsif [')', ']', '>', '}'].include?(chars.last)
        pending.unshift(chars.pop)
      else
        closers << CLOSERS[chars.pop.to_sym]
      end
      close_line(chars, closers, pending)
    end

    def closing_score(closers)
      score = 0
      closers.each do |closer|
        score *= 5
        score += case closer.to_sym
                 when :")"
                   1
                 when :"]"
                   2
                 when :"}"
                   3
                 when :">"
                   4
                 end
      end
      score
    end

    def part1(input)
      errors = []
      input.each do |line|
        errors << parse_line(line).last
      end
      score(errors.flatten)
    end

    def part2(input)
      incomplete = []
      input.each do |line|
        incomplete << line if parse_line(line).last.empty?
      end

      # p incomplete

      closings = []
      incomplete.each do |line|
        closings << close_line(line.chars)
      end

      closing_scores = closings.map { |c| closing_score(c) }
      closing_scores.sort[closing_scores.size / 2]
    end
  end
end
