require "byebug"

module Year2020
  class Binary
    def self.to_decimal(binary)
      raise ArgumentError if binary.match?(/[^01]/)

      binary.reverse.chars.map.with_index do |digit, index|
        digit.to_i * 2**index
      end.sum
    end
  end

  class Day14
    def parse_mask(input)
      input.split(/\s+=\s+/).last.chars.map { |x| x == "X" ? nil : x.to_i }
    end

    def apply_mask(mask, val)
      masked = val.dup
      # puts format("masked: %s", masked.inspect)
      0.upto(mask.size - 1) do |m|
        next if mask[m].nil?

        # puts format("masking: m: %s, val: %s, mask: %s, masked: %s", m, val[m], mask[m], masked[m])
        masked[m] = mask[m]
      end
      masked.join
    end

    def part1(input)
      mask = parse_mask(input.shift)
      # puts format("mask: %s, size: %s", mask, mask.size)

      mem = Array.new(64, 0)
      input.each do |instruction|
        if instruction =~ /mask/
          mask = parse_mask(instruction) if instruction
          next
        else
          m, val = instruction.split(/\s+=\s+/)
          # puts format("m: %s, val: %s", m, val)
          pos = m.match(/\[(\d+)\]/)[1].to_i

          # puts val
          bval = format("%036b", val)
          # puts bval.inspect
          masked = apply_mask(mask, bval.chars)
          # puts format("masked: %s", masked)
          # puts Binary.to_decimal(masked)
          mem[pos] = Binary.to_decimal(masked)
        end
      end
      # puts mem.compact.inspect
      mem.compact.sum
    end

    def apply_mask2(mask, val)
      masked = val.dup
      # puts format("mask: %s, size: %s", mask.inspect, mask.size)
      # puts format("masked: %s, size: %s", masked.inspect, masked.size)
      address = []
      0.upto(val.size - 1) do |m|
        address[m] = case mask[mask.size - masked.size + m]
                     when 0
                       val[m]
                     when 1
                       1
                     else
                       "X"
                     end
      end
      address.join
    end

    def expand_addresses(address)
      return [address] unless address.include?("X")

      a1 = address.sub("X", "0")
      a2 = address.sub("X", "1")
      expand_addresses(a1) + expand_addresses(a2)
    end

    def part2(input)
      mask = nil
      mem = Hash.new(0)

      puts
      input.each do |instruction|
        # puts format("instruction: %s", instruction.inspect)

        if instruction =~ /mask/
          mask = parse_mask(instruction) if instruction
          next
        end

        m, val = instruction.split(/\s+=\s+/)
        # puts format("m: %s, val: %s", m, val)
        pos = m.match(/\[(\d+)\]/)[1].to_i

        binary_pos = format("%b", pos)

        address = apply_mask2(mask, binary_pos.chars)
        addresses = expand_addresses(address)

        # puts format("address: %s", address.inspect)
        # puts format("addresses: %s", addresses.inspect)
        addresses.each do |address|
          mem[Binary.to_decimal(address)] = val.to_i
        end
      end
      # puts mem.compact.inspect
      mem.values.sum
    end
  end
end
