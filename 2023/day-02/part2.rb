input=<<~EOF
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
EOF

def part2(input, max_red = 12, max_green = 13, max_blue = 14)
  puts input
  powers = []
  input.each do |line|
    game, cubes = line.split(/:/)
    game.gsub!(/Game /, '')
    game = game.to_i

    reds = []
    greens = []
    blues = []


    puts format("Game: %s", game)
    cubes.split(/;/).map(&:strip).each do |draw|
      # puts format("%s %s", game, draw.inspect)

      red = draw.match(/\d+\sred/)[0].split(/ /).first.to_i if draw =~ /\d+\sred/
      green = draw.match(/\d+\sgreen/)[0].split(/ /).first.to_i if draw =~ /\d+\sgreen/
      blue = draw.match(/\d+\sblue/)[0].split(/ /).first.to_i if draw =~ /\d+\sblue/

      reds << red if red
      greens << green if green
      blues << blue if blue
    end

    red = reds.max
    green = greens.max
    blue = blues.max

    puts format("red: %s, green: %s, blue: %s", red, green, blue)
    power = red * green * blue
    powers << power
    puts format("power: %s", power)
  end
  puts powers.sum
end

# part2(input.split(/\n/))
part2(File.readlines("input.txt"))
