year = Time.now.year
day = Time.now.day
formatted_day = "day-%02d" % day
location = format("%s/%s", year, formatted_day)

puts location

puts "https://adventofcode.com/#{year}/day/#{day}/input"

`mkdir -p #{location}`
`wget --no-cookies --header "Cookie: session=$SESSION" https://adventofcode.com/#{year}/day/#{day}/input -O #{location}/input.txt`

`cp templates/* #{location}/.`
`open https://adventofcode.com/#{year}/day/#{day}`
`cd #{location}`
