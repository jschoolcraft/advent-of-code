require "byebug"

module Year2020
  class Day04
    def required_fields
      %w(byr iyr eyr hgt hcl ecl pid cid)
    end

    def parse_passports(input)
      passports = []
      passport = []

      input.each do |i|
        if i.strip.size > 0
          passport << i
        else
          passports << passport
          passport = []
        end
      end
      passports << passport
    end

    def valid?(field, value)
      case field
      when "byr"
        (1920..2002).include? value.to_i
      when "iyr"
        (2010..2020).include? value.to_i
      when "eyr"
        (2020..2030).include? value.to_i
      when "hgt"
        unit = value.chars.last(2).join
        return false unless ["in", "cm"].include? unit

        if unit == "in"
          (59..76).include? value.to_i
        else
          (150..193).include? value.to_i
        end
      when "hcl"
        value.match(/^#[0-9a-f]{6}$/)
      when "ecl"
        return false if value.split.size > 1

        %w[amb blu brn gry grn hzl oth].include? value
      when "pid"
        value.match(/^\d{9}$/)
      when "cid"
        true
      else
        false
      end
    end

    def part1(input)
      passports = parse_passports(input)

      valid = 0
      passports.each do |passport|
        passport
          .map! { |p| p.split(/ /) }
          .flatten!
          .map! { |p| p.split(/:/).first }

        temp_required_fields = required_fields - ["cid"]
        temp_required_fields.map! { |t| passport.include? t }

        next unless temp_required_fields.all?

        valid += 1
      end

      valid
    end

    def part2(input)
      passports = parse_passports(input)

      valid = 0
      passports.each do |passport|
        passport
          .map! { |p| p.split(/ /) }
          .flatten!
          # .map! { |p| p.split(/:/).first }

        temp_required_fields = required_fields - ["cid"]
        temp_required_fields.map! { |t| passport.map { |p| p.split(/:/).first }.include? t }

        next unless temp_required_fields.all?

        valid += 1 if passport.map do |values|
          field, value = values.split(/:/)
          valid?(field, value)
        end.all?
      end

      valid
    end
  end
end
