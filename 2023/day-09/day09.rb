require "byebug"

module Year2023
  class Day09
    def next_value_end(history)
      sequences = []
      sequences << history

      while !history.all?(&:zero?) do
        history = history.each_cons(2).map { |a,b| b - a }
        sequences << history
      end

      if sequences.last.empty?
        sequences.pop
        sequences << [0]
      end

      # sequences.map { |sequence| p sequence}

      sequences.reverse!
      0.upto(sequences.size - 1) do |i|
        if i.zero?
          sequences[i] << 0
          next
        end

        sequences[i] << sequences[i].last + sequences[i - 1].last
      end

      # puts
      # sequences.map { |sequence| p sequence}

      sequences.last.last
    end

    def part1(input)
      histories = input.split(/\n/).map do |line|
        line.scan(/\-?\d+/).map(&:to_i)
      end

      histories.map { |h| next_value_end(h) }.sum
    end

    def next_value_beginning(history)
      sequences = []
      sequences << history

      while !history.all?(&:zero?) do
        history = history.each_cons(2).map { |a,b| b - a }
        sequences << history
      end

      if sequences.last.empty?
        sequences.pop
        sequences << [0]
      end

      # sequences.map { |sequence| p sequence}

      sequences.reverse!
      0.upto(sequences.size - 1) do |i|
        if i.zero?
          sequences[i].unshift 0
          next
        end

        sequences[i].unshift(sequences[i].first - sequences[i - 1].first)
      end

      # puts
      # sequences.map { |sequence| p sequence}

      sequences.last.first
    end

    def part2(input)
      histories = input.split(/\n/).map do |line|
        line.scan(/\-?\d+/).map(&:to_i)
      end

      histories.map { |h| next_value_beginning(h) }.sum
    end
  end
end
