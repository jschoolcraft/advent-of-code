year = Time.now.year
day = Time.now.day
formatted_day = "day-%02d" % day

puts "https://adventofcode.com/#{year}/day/#{day}/input"

`mkdir -p #{formatted_day}`
`wget --no-cookies --header "Cookie: session=$SESSION" https://adventofcode.com/#{year}/day/#{day}/input -O #{formatted_day}/input.txt`
