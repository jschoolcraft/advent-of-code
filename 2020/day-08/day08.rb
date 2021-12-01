require "byebug"
require "set"

module Year2020
  class Day08
    def run(commands, index)
    end

    def part1(input)
      i = 0
      acc = 0
      executed = Set.new

      while true
        if executed.include?(i)
          return acc
          break
        end

        executed.add(i)

        op, arg = input[i].split
        arg = arg.to_i

        case op
        when "acc"
          acc += arg
        when "jmp"
          i += arg - 1
        end

        i += 1
      end
    end

    def part2(input)
      input.size.times do |i|
        fixed_ops = input.map(&:clone)

        instr = fixed_ops[i]

        if instr =~ /jmp/
          instr.gsub!("jmp", "nop")
        elsif instr =~ /nop/
          instr.gsub!("nop", "jmp")
        else
          next
        end

        acc = run(fixed_ops)

        if acc
          return acc
          break
        end
      end
    end

    def run(ops)
      i = 0
      acc = 0
      executed = Set.new

      while i < ops.size
        return nil if executed.include?(i)

        executed.add(i)

        op, arg = ops[i].split
        arg = arg.to_i

        case op
        when "acc"
          acc += arg
        when "jmp"
          i += arg - 1
        end

        i += 1
      end

      acc
    end
  end
end
