require "byebug"

module Year2021
  class Day08
    def part1(input)
      input.map { |line| line.split(/\|/).last.strip }
        .join(" ")
        .split(/\s+/)
        .select { |output| [2, 4, 3, 7].include? output.size }
        .size
    end

    def find_segments(input)
      line = input.strip.split(/\s+/)
      # acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab
      # ab      => 1
      # eafb    => 4
      # dab     => 7
      # acedgfb => 8
      #
      #   0:      1:      2:      3:      4:
      #  aaaa    ....    aaaa    aaaa    ....
      # b    c  .    c  .    c  .    c  b    c
      # b    c  .    c  .    c  .    c  b    c
      #  ....    ....    dddd    dddd    dddd
      # e    f  .    f  e    .  .    f  .    f
      # e    f  .    f  e    .  .    f  .    f
      #  gggg    ....    gggg    gggg    ....
      #
      #   5:      6:      7:      8:      9:
      #  aaaa    aaaa    aaaa    aaaa    aaaa
      # b    .  b    .  .    c  b    c  b    c
      # b    .  b    .  .    c  b    c  b    c
      #  dddd    dddd    ....    dddd    dddd
      # .    f  e    f  .    f  e    f  .    f
      # .    f  e    f  .    f  e    f  .    f
      #  gggg    gggg    ....    gggg    gggg
      #
      segments = {}
      one = line.detect { |s| s.size == 2 }
      four = line.detect { |s| s.size == 4 }
      seven = line.detect { |s| s.size == 3 }
      eight = line.detect { |s| s.size == 7 }

      three = line.select { |s| s.size == 5 }.detect { |s| s.chars.include?(one.chars.first) && s.chars.include?(one.chars.last) }

      # puts format("one: %s, three: %s, four: %s, seven: %s, eight: %s", one, three, four, seven, eight)

      # p line.select { |s| s.size == 5 && s != three }
      candidates = line.select { |s| s.size == 5 && s != three }.map { |s| s.chars - four.chars - seven.chars }
      segments["e"] = (candidates.detect { |c| c.size == 2 } - candidates.detect { |c| c.size == 1 }).first

      segments["f"] = line.select { |s| s.size == 6 }.select { |c| (c.chars - one.chars).size == 5 }.first.chars.detect { |c| one.chars.include? c }

      segments["c"] = one.gsub(Regexp.new(segments["f"]), '')
      segments["a"] = (seven.chars - one.chars).first
      segments["g"] = (three.chars - seven.chars - four.chars).first
      segments["b"] = (four.chars - three.chars).first
      segments["d"] = ((three.chars - seven.chars) - [segments["g"]]).first
      segments
    end

    def segments_to_digit(segments, map)
      sorted = segments.chars.sort.join
      # puts
      # puts format('segments: %s', segments)
      # puts format('sorted: %s', sorted)
      # puts format('map: %s', map)

      zero  = [map['a'], map['b'], map['c'], map['e'], map['f'], map['g']].sort.join
      one   = [map['c'], map['f']].sort.join
      two   = [map['a'], map['c'], map['d'], map['e'], map['g']].sort.join
      three = [map['a'], map['c'], map['d'], map['f'], map['g']].sort.join
      four  = [map['b'], map['c'], map['d'], map['f']].sort.join
      five  = [map['a'], map['b'], map['d'], map['f'], map['g']].sort.join
      six   = [map['a'], map['b'], map['d'], map['e'], map['f'], map['g']].sort.join
      seven = [map['a'], map['c'], map['f']].sort.join
      eight = [map['a'], map['b'], map['c'], map['d'], map['e'], map['f'], map['g']].sort.join
      nine  = [map['a'], map['b'], map['c'], map['d'], map['f'], map['g']].sort.join

      case sorted
      when zero
        0
      when one
        1
      when two
        2
      when three
        3
      when four
        4
      when five
        5
      when six
        6
      when seven
        7
      when eight
        8
      when nine
        9
      end
    end

    def process_output(input)
      signal, output = input.split(/\|/)
      mappings = find_segments(signal)
      output.strip.split(/\s+/).map { |o| segments_to_digit(o, mappings) }.join.to_i
    end

    def part2(input)
      input.map { |i| process_output(i) }.sum
    end
  end
end
