require 'thor'
require 'fileutils'
require 'erb'

class Aoc < Thor
  include Thor::Actions

  def self.source_root
    File.dirname(__FILE__)
  end

  desc 'bootstrap YEAR DAY', 'bootstraps an aoc directory for the given YEAR and DAY'
  method_option :bootstrap, aliases: '-b'
  def bootstrap(year = Time.now.year, day = Time.now.day)
    padded_day = format("%02d", day)
    location = format("%s/day-%s", year, padded_day)
    puts format("bootstrapping %s, %s", year, day)

    puts format("creating directory: %s", location)
    FileUtils.mkdir_p(location) unless Dir.exist?(location)

    puts "creating files"
    templates = [
      ["templates/day00.rb", "#{location}/day#{padded_day}.rb"],
      ["templates/test_day00.rb", "#{location}/test_day#{padded_day}.rb"],
      ["templates/Gemfile", "#{location}/Gemfile"],
    ]

    options = {
      day: padded_day,
      year: year,
    }
    templates.each do |source, target|
      template(source, target, options) unless File.exist?(target)
    end

    puzzle_url = "https://adventofcode.com/#{year}/day/#{day}"
    input_url = format("%s/input", puzzle_url)
    puts format("Downloading puzzle input: %s", input_url)
    `wget --no-cookies --header "Cookie: session=$SESSION" #{input_url} -O #{location}/input.txt`

    puts format("cd %s", location)
    puts "watchexec -ncr -- bundle exec ruby test_day#{padded_day}.rb"
    `open #{puzzle_url}`
  end
end

Aoc.start
