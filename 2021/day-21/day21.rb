require "byebug"
require "ostruct"

module Year2021
  class DeterministicDice
    attr_reader :num_rolls

    def initialize(sides)
      @sides = sides
      @last_roll = 0
      @num_rolls = 0
    end

    def roll
      @last_roll += 1
      @num_rolls += 1
      @last_roll = 1 if @last_roll > 100
      @last_roll
    end
  end

  class Day21
    def game_won?(players, score)
      players.any? { |p| p.score >= score }
    end

    def play_turn(player, dice)
      roll = 0
      3.times { roll += dice.roll }

      new_position = (player.position + roll) % 10
      new_position = 10 if new_position.zero?

      player.score += new_position
      player.position = new_position
    end

    def part1(input)
      p1 = OpenStruct.new(score: 0, position: 1)
      p2 = OpenStruct.new(score: 0, position: 1)
      score = 1000

      p1.position, p2.position = input.map { |i| i.split(/: /).last.to_i }
      dd = DeterministicDice.new(100)

      until game_won?([p1, p2], score)
        play_turn(p1, dd)
        break if game_won?([p1, p2], score)

        play_turn(p2, dd)
      end

      loser = [p1, p2].detect { |player| player.score < 1000 }
      loser.score * dd.num_rolls
    end

    def part2(input)
      4242
    end
  end
end
