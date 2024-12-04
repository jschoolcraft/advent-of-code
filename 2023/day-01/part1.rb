
input = <<~EOF
1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
EOF

def part1(input)
  foo = []
  input.each do |line|
    numbers = line.scan(/\d/)
    coords = case numbers.length
    when 0
      raise "WTF"
    when 1
      numbers[0] * 2
    else
      numbers.first + numbers.last
    end
    foo << coords.to_i
  end
  puts foo.sum
end

# part1(input.split(/\n/))
part1(File.read("input.txt").split(/\n/))
