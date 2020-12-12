require "byebug"

module Year2020
  class Day12
    def parse_input(input)
      actions = input.map do |i|
        j = i.chars
        action = j.shift
        value = j.join.to_i
        [action, value]
      end
      actions
    end

    def move(north:, east:, action:, value:)
      case action
      when "N"
        north += value
      when "S"
        north -= value
      when "E"
        east += value
      when "W"
        east -= value
      end
      [north, east]
    end

    def turn(facing:, turn:, value:)
      directions = {
        E: 0,
        S: 90,
        W: 180,
        N: 270,
      }

      adjusted = if turn == "R"
                   (directions[facing.to_sym] + value) % 360
                 else
                   (directions[facing.to_sym] - value) % 360
                 end
      directions.select { |k,v| v == adjusted }.first.first.to_s
    end

    def part1(input)
      north = 0
      east  = 0
      facing = "E"

      actions = parse_input(input)

      actions.each do |action, value|
        case action
        when "N", "S", "E", "W"
          north, east = move(north: north, east: east, action: action, value: value)
        when "L", "R"
          facing = turn(facing: facing, turn: action, value: value)
        when "F"
          north, east = move(north: north, east: east, action: facing, value: value)
        end
        format("facing: %s, north: %s, east: %s", facing, north, east)
      end

      north.abs + east.abs
    end

    def move_to_waypoint(wp_n:, wp_e:, north:, east:, value:)
      [
        north + wp_n * value,
        east + wp_e * value
      ]
    end

    def move_waypoint(north:, east:, action:, value:)
      case action
      when "N"
        north += value
      when "S"
        north -= value
      when "E"
        east += value
      when "W"
        east -= value
      end
      [north, east]
    end

    def rotate_waypoint(wp_n:, wp_e:, turn:, value:)
      normalized = value % 360
      normalized = 360 - value if turn == "L"

      case normalized
      when 0, 360
        # no op
      when 90
        wp_n, wp_e = -wp_e, wp_n
      when 180
        wp_n *= -1
        wp_e *= -1
      when 270
        wp_n, wp_e = wp_e, -wp_n
      end

      [wp_n, wp_e]
    end

    def part2(input)
      wp_n = 1
      wp_e = 10

      sh_n = 0
      sh_e = 0

      facing = "E"

      actions = parse_input(input)

      actions.each do |action, value|
        case action
        when "N", "S", "E", "W"
          wp_n, wp_e = move_waypoint(north: wp_n, east: wp_e, action: action, value: value)
        when "L", "R"
          wp_n, wp_e = rotate_waypoint(wp_n: wp_n, wp_e: wp_e, turn: action, value: value)
        when "F"
          sh_n, sh_e = move_to_waypoint(wp_n: wp_n, wp_e: wp_e, north: sh_n, east: sh_e, value: value)
        end
      end

      sh_n.abs + sh_e.abs
    end
  end
end
