require "minitest/autorun"
require "./part2"

class TestDay05 < Minitest::Test
  def setup
    @solution = Year2023::Day05.new
    @test_input = <<~EOF
seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4
    EOF
  end

  def test_parses_input
    parsed_input = @solution.parse_input(@test_input.split(/\n/))

    assert_equal [79, 14, 55, 13], parsed_input["seeds"]

    assert_includes parsed_input["seed-to-soil"], [50, 98, 2]
    assert_includes parsed_input["seed-to-soil"], [52, 50, 48]
    refute_includes parsed_input["seed-to-soil"], []

    assert_includes parsed_input["soil-to-fertilizer"], [0, 15, 37]
    assert_includes parsed_input["soil-to-fertilizer"], [37, 52, 2]
    assert_includes parsed_input["soil-to-fertilizer"], [39, 0, 15]
    refute_includes parsed_input["soil-to-fertilizer"], []

    assert_includes parsed_input["fertilizer-to-water"], [49, 53, 8]
    assert_includes parsed_input["fertilizer-to-water"], [0, 11, 42]
    assert_includes parsed_input["fertilizer-to-water"], [42, 0, 7]
    assert_includes parsed_input["fertilizer-to-water"], [57, 7, 4]
    refute_includes parsed_input["fertilizer-to-water"], []

    assert_includes parsed_input["water-to-light"], [88, 18, 7]
    assert_includes parsed_input["water-to-light"], [18, 25, 70]
    refute_includes parsed_input["water-to-light"], []

    assert_includes parsed_input["light-to-temperature"], [45, 77, 23]
    assert_includes parsed_input["light-to-temperature"], [81, 45, 19]
    assert_includes parsed_input["light-to-temperature"], [68, 64, 13]
    refute_includes parsed_input["light-to-temperature"], []

    assert_includes parsed_input["temperature-to-humidity"], [0, 69, 1]
    assert_includes parsed_input["temperature-to-humidity"], [1, 0, 69]
    refute_includes parsed_input["temperature-to-humidity"], []

    assert_includes parsed_input["humidity-to-location"], [60, 56, 37]
    assert_includes parsed_input["humidity-to-location"], [56, 93, 4]
    refute_includes parsed_input["humidity-to-location"], []
  end

  def test_find_location
    parsed_input = @solution.parse_input(@test_input.split(/\n/))

    assert_equal 81, @solution.find_location(seed: 79, map: parsed_input, section: "seed-to-soil")
    assert_equal 14, @solution.find_location(seed: 14, map: parsed_input, section: "seed-to-soil")
    assert_equal 57, @solution.find_location(seed: 55, map: parsed_input, section: "seed-to-soil")
    assert_equal 13, @solution.find_location(seed: 13, map: parsed_input, section: "seed-to-soil")

    assert_equal 81, @solution.find_location(seed: 79, map: parsed_input, section: "soil-to-fertilizer")
    assert_equal 53, @solution.find_location(seed: 14, map: parsed_input, section: "soil-to-fertilizer")
    assert_equal 57, @solution.find_location(seed: 55, map: parsed_input, section: "soil-to-fertilizer")
    assert_equal 52, @solution.find_location(seed: 13, map: parsed_input, section: "soil-to-fertilizer")

    # Seed 79, soil 81, fertilizer 81, water 81, light 74, temperature 78, humidity 78, location 82.

    assert_equal 81, @solution.find_location(seed: 79, map: parsed_input, section: "seed-to-soil")
    assert_equal 81, @solution.find_location(seed: 79, map: parsed_input, section: "soil-to-fertilizer")
    assert_equal 81, @solution.find_location(seed: 79, map: parsed_input, section: "fertilizer-to-water")
    assert_equal 74, @solution.find_location(seed: 79, map: parsed_input, section: "water-to-light")
    assert_equal 78, @solution.find_location(seed: 79, map: parsed_input, section: "light-to-temperature")
    assert_equal 78, @solution.find_location(seed: 79, map: parsed_input, section: "temperature-to-humidity")
    assert_equal 82, @solution.find_location(seed: 79, map: parsed_input, section: "humidity-to-location")

    assert_equal 14, @solution.find_location(seed: 14, map: parsed_input, section: "seed-to-soil")
    assert_equal 53, @solution.find_location(seed: 14, map: parsed_input, section: "soil-to-fertilizer")
    assert_equal 49, @solution.find_location(seed: 14, map: parsed_input, section: "fertilizer-to-water")
    assert_equal 42, @solution.find_location(seed: 14, map: parsed_input, section: "water-to-light")
    assert_equal 42, @solution.find_location(seed: 14, map: parsed_input, section: "light-to-temperature")
    assert_equal 43, @solution.find_location(seed: 14, map: parsed_input, section: "temperature-to-humidity")
    assert_equal 43, @solution.find_location(seed: 14, map: parsed_input, section: "humidity-to-location")

    assert_equal 82, @solution.find_location(seed: 79, map: parsed_input)
    assert_equal 43, @solution.find_location(seed: 14, map: parsed_input)
    assert_equal 86, @solution.find_location(seed: 55, map: parsed_input)
    assert_equal 35, @solution.find_location(seed: 13, map: parsed_input)
  end

  def test_seeds
    parsed_input = @solution.parse_input(@test_input.split(/\n/))
    assert_equal 27, @solution.all_seeds(parsed_input["seeds"]).size
  end

  def test_sample_part_2
    assert_equal 46, @solution.part2(@test_input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split(/\n/)

    assert_equal 59370572, @solution.part2(input)
  end
end
