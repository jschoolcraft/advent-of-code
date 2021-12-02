# Advent of Code

My solutions to the https://adventofcode.com/

## Usage

`aoc.rb` is a thor script that bootstraps a given puzzle with (for me) sane defaults:

- a test file
- a solution file with 2 methods (`part1` and `part2`)
- puzzle input

Each day it goes something like this:

```
cd ~/code/advent-of-code
ruby aoc.rb bootstrap
cd YEAR/DAY
vim # in one terminal
watchexec -ncr -- bundle exec ruby test_dayDAY.rb # in another terminal
```

### SESSION

Puzzle input is specific to a given user, we can automate the collection of the sample data by passing wget a SESSION.  To do that:

- Log into the site using e.g. github credentials
- Inspect the page
- Go to Application
- Go to Cookies
- Copy the session value and export it to `SESSION` in `.envrc` or whatever
