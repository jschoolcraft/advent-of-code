input = <<~EOF
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
EOF

def part2(input)
  number_words = %w[ one two three four five six seven eight nine ]
  digits = (1..9).map(&:to_s)
  all = number_words + digits

  coords = []
  input.each do |line|
    l_match = {}
    r_match = {}
    all.map { |t| l_match[t] = line.index(t) }
    all.map { |t| r_match[t] = line.rindex(t) }

    l_match.compact!
    r_match.compact!

    # puts "l_match:"
    # puts l_match.inspect
    first = l_match.select { |k,v| v == l_match.values.min }.first.first
    if first.length > 1
      first = digits[number_words.index(first)]
    end
    # puts "r_match:"
    # puts r_match.inspect
    second = r_match.select { |k,v| v == r_match.values.max }.first.first
    if second.length > 1
      second = digits[number_words.index(second)]
    end
    value = first + second
    coords << value
    puts format("input: %s, value: %s", line, value)
  end
  puts coords.map(&:to_i).sum

end

# puts part2(input.split(/\n/))
puts part2(File.read("input.txt").split(/\n/))
