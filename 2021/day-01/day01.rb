require "byebug"

module Year2021
  class Day01
    def part1(input)
      # => [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
      # > input.split.map(&:to_i).each_cons(2).each { |e| p e }
      # [199, 200]
      # [200, 208]
      # [208, 210]
      # [210, 200]
      # [200, 207]
      # [207, 240]
      # [240, 269]
      # [269, 260]
      # [260, 263]
      input
        .map(&:to_i)
        .each_cons(2) # grab pairs of input
        .select { |e| e.last > e.first }
        .size
    end

    def part2(input)
      # > input.split(/\n/).map(&:to_i)
      # => [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
      # > input.split(/\n/).map(&:to_i).each_cons(3).each { |e| p e }
      # [199, 200, 208]
      # [200, 208, 210]
      # [208, 210, 200]
      # [210, 200, 207]
      # [200, 207, 240]
      # [207, 240, 269]
      # [240, 269, 260]
      # [269, 260, 263]
      # => nil
      # > input.split(/\n/).map(&:to_i).each_cons(3).each_cons(2).each { |e| p e }
      # [[199, 200, 208], [200, 208, 210]]
      # [[200, 208, 210], [208, 210, 200]]
      # [[208, 210, 200], [210, 200, 207]]
      # [[210, 200, 207], [200, 207, 240]]
      # [[200, 207, 240], [207, 240, 269]]
      # [[207, 240, 269], [240, 269, 260]]
      # [[240, 269, 260], [269, 260, 263]]
      # => nil
      input
        .map(&:to_i)
        .each_cons(3) # grab windows of input
        .each_cons(2) # grab pairs of input
        .select { |e| e.last.sum > e.first.sum }
        .size
    end
  end
end
