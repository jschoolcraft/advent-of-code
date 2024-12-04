input=<<~EOF
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
EOF

def part1(input, max_red = 12, max_green = 13, max_blue = 14)
  puts input
  games = []
  input.each do |line|
    game, cubes = line.split(/:/)
    game.gsub!(/Game /, '')
    game = game.to_i

    valid_game = true
    cubes.split(/;/).map(&:strip).each do |draw|
      next unless valid_game

      puts format("%s %s", game, draw.inspect)

      red = draw.match(/\d+\sred/)[0].split(/ /).first.to_i if draw =~ /\d+\sred/
      green = draw.match(/\d+\sgreen/)[0].split(/ /).first.to_i if draw =~ /\d+\sgreen/
      blue = draw.match(/\d+\sblue/)[0].split(/ /).first.to_i if draw =~ /\d+\sblue/

      # puts format("red: %s, green: %s, blue: %s", red, green, blue)

      # puts "invalid game red" if red && red > max_red
      # puts "invalid game green" if green && green > max_green
      # puts "invalid game blue" if blue && blue > max_blue

      valid_game = false if red && red > max_red
      valid_game = false if green && green > max_green
      valid_game = false if blue && blue > max_blue
    end
    games << game if valid_game
  end

  puts games.uniq.inspect
  puts games.uniq.size
  puts games.uniq.sum
end

# part1(input.split(/\n/))
part1(File.readlines("input.txt"))
