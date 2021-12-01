require "byebug"

module Year2020
  class Day02
    def part1(input)
      # 1-3 a: abcde
      # 1-3 b: cdefg
      # 2-9 c: ccccccccc
      valid = 0
      input.each do |i|
        bound, char, password = i.split(/ /)
        upper, lower = bound.split(/\-/).map(&:to_i)
        range = Range.new(upper, lower)
        char = char.chars.first
        occurrences = password.chars.select { |c| c == char }.size

        # puts format("Range: %s, char: %s, password: %s, occurrences: %s, valid?: %s",
        #             range,
        #             char,
        #             password,
        #             occurrences,
        #             range.include?(occurrences)
        #            )
        valid += 1 if range.include? occurrences
      end
      valid
    end

    def part2(input)
      # 1-3 a: abcde
      # 1-3 b: cdefg
      # 2-9 c: ccccccccc
      valid = 0
      puts
      input.each do |i|
        bound, char, password = i.split(/ /)
        i1, i2 = bound.split(/\-/).map(&:to_i).map { |i| i - 1 }
        char = char.chars.first
        password_chars = password.chars
        possibles = [password_chars[i1], password_chars[i2]]

        # puts format("i1: %s, i2: %s, char: %s, password: %s, p[%s]: %s, p[%s]: %s",
        #             i1,
        #             i2,
        #             char,
        #             password,
        #             i1,
        #             password_chars[i1],
        #             i2,
        #             password_chars[i2],
        #            )
        valid += 1 if possibles.select { |p| p == char }.size == 1
      end
      valid
    end
  end
end
