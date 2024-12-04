require "byebug"

module Year2024
  class Day02
    def part1(input)
      reports = parse_input(input)
      reports.map do |report|
        is_safe?(report)
      end.count { |e| e == true }
    end

    def part2(input)
      reports = parse_input(input)

      report_results = reports.map do |report|
        # puts report.inspect
        if is_safe?(report)
          true
        else
          range = report.length - 1
          made_safe = false
          0.upto(range) do |i|
            next if made_safe
            new_report = report.values_at(*0.upto(report.length - 1).to_a.reject {|e| e == i})
            if is_safe?(new_report)
              # puts "*" * 80
              # puts new_report.inspect
              # puts "*" * 80
              made_safe = true
            end
          end
          made_safe
        end
      end.count { |e| e == true }
    end

    def parse_input(input)
      input.map do |line|
        line.split(" ").map(&:to_i)
      end
    end

    def is_safe?(report)
      ascending_or_descending = report.sort == report || report.sort.reverse == report
      return false unless ascending_or_descending

      # puts report.inspect
      in_tolerance = []
      1.upto(report.length - 1) do |i|
        diff = (report[i] - report[i - 1]).abs
        # puts format("(%s - %s = %s)", report[i], report[i-1], (report[i] - report[i - 1]).abs)
        in_tolerance << (diff >= 1 && diff <= 3)
      end
      in_tolerance.all?(true)
    end
  end
end
