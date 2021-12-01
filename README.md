# Advent of Code

My solutions to the https://adventofcode.com/

## SESSION

Puzzle input is specific to a given user, we can automate the collection of the sample data by passing wget a SESSION.  To do that:

- Log into the site using e.g. github credentials
- Inspect the page
- Go to Application
- Go to Cookies
- Copy the session value and export it to `SESSION` in `.envrc` or whatever
