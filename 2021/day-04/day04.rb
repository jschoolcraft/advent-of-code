require "byebug"

module Year2021
  class Day04
    def parse_input(input)
      number_input, *boards_input = input.split(/\n/)

      numbers = number_input.split(/,/).map(&:to_i)

      boards = boards_input
        .reject(&:empty?)
        .each_slice(5)
        .map { |rows| rows.map { |row| row.strip.split(/\s+/).map(&:to_i) } }

      [numbers, boards]
    end

    def mark_boards(number, boards)
      boards.map do |b|
        b.map do |row|
          # replace all `number` with `nil`
          row.map { |e| e == number ? nil : e }
        end
      end
    end

    def winning_board(boards)
      rows = boards.select do |board|
        !board.select { |rows| rows.all?(nil) }.empty?
      end

      columns = boards.select do |board|
        !board.transpose.select { |rows| rows.all?(nil) }.empty?
      end

      winners = (rows+columns).uniq
    end

    def find_next_winner(numbers, boards)
      last_number = nil
      winners = nil
      numbers.each do |number|
        last_number = number
        boards = mark_boards(number, boards)
        winners = winning_board(boards)
        break unless winners.empty?
      end
      [last_number, winners, boards]
    end

    def part1(input)
      numbers, boards = parse_input(input)
      last_number, winner, boards = find_next_winner(numbers, boards)

      winner.first.map { |row| row.map(&:to_i).sum }.sum * last_number
    end

    def find_last_winner(numbers, boards)
      last_number, winners, boards = find_next_winner(numbers, boards)

      remaining_numbers = numbers[numbers.index(last_number)+1..]
      winners.each { |winner| boards.delete(winner) }

      return [last_number, winners.first, winners] if boards.empty?

      find_last_winner(remaining_numbers, boards)
    end

    def part2(input)
      numbers, boards = parse_input(input)

      last_number, winner, boards = find_last_winner(numbers, boards)
      winner.map { |row| row.map(&:to_i).sum }.sum * last_number
    end
  end
end
