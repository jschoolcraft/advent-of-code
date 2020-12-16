require "byebug"

module Year2020
  class Day16
    def parse_input(input)
      rules = {}
      input.shift.split(/\n/).each do |rule|
        label, ranges = rule.split(/:\s*/)
        rules[label] = ranges.strip.split(/\s+or\s+/).map { |r| Range.new(*(r.split(/\-/).map(&:to_i))) }
      end

      ticket = input.shift.split(/\n/).last.split(/,/).map(&:to_i)

      nearby = input.shift.split(/:/).last.strip.split(/\n/).map { |n| n.split(/,/).map(&:to_i) }
      [rules, ticket, nearby]
    end

    def part1(input)
      rules, ticket, nearby = parse_input(input)

      # puts format("rules: %s", rules)
      # puts format("my ticket: %s", ticket)
      # puts format("nearby: %s", nearby)

      invalid = []
      nearby.each do |ticket|
        # puts format("ticket: %s", ticket)
        ticket.each do |value|
          # puts format("value: %s", value)
          foo = rules.values.map do |ranges|
            ranges.map { |range| range.include?(value) }.any?
          end
          # puts format("foo: %s", foo)
          next if foo.any?

          invalid << value
        end
      end

      puts format("invalid: %s", invalid)
      invalid.sum
    end

    def part2(input)
      rules, ticket, nearby = parse_input(input)

      puts format("rules: %s", rules)
      # puts format("my ticket: %s", ticket)
      # puts format("nearby: %s", nearby)

      valid = nearby.select do |ticket|
        # puts format("ticket: %s", ticket)
        ticket.each do |value|
          # puts format("value: %s", value)
          foo = rules.values.map do |ranges|
            ranges.map { |range| range.include?(value) }.any?
          end
          # puts format("foo: %s", foo)
          next if foo.any?

          # invalid << value
        end.any?
      end

      puts format("valid: %s", valid)

      rules.each do |name, ranges|
        puts format("name: %s, ranges: %s", name, ranges)
        0.upto(ticket.size - 1).each do |i|
          fields = valid.map { |v| v[i] }
          puts format("values: %s", fields)
          fields.each do |field|
            puts format(
              "name: %s, i: %s, field: %s, ranges: %s, included: %s",
              name,
              i,
              field,
              ranges,
              ranges.map { |r| r.include?(field) }.any?
            )
          end
        end
      end
    end
  end
end
