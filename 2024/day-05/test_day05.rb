require "minitest/autorun"
require "./day05"

class TestDay05 < Minitest::Test
  def setup
    @solution = Year2024::Day05.new
  end

  def test_sample_part_1
    rules = sample_data_rules.split(/\n/)
    updates = sample_data_updates.split(/\n/)
    assert_equal 143, @solution.part1(rules, updates)
  end

  def test_part_1
    rules = File.readlines("./input-rules.txt")
    updates = File.readlines("./input-updates.txt")

    assert_equal 4462, @solution.part1(rules, updates)
  end

  def test_sample_part_2
    rules = sample_data_rules.split(/\n/)
    updates = sample_data_updates.split(/\n/)

    assert_equal 123, @solution.part2(rules, updates)
  end

  def test_part_2
    rules = File.readlines("./input-rules.txt")
    updates = File.readlines("./input-updates.txt")

    assert_equal 4242, @solution.part2(rules, updates)
  end

  def sample_data_rules
    <<~EOF
47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13
    EOF
  end

  def sample_data_updates
    <<~EOF
75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47
    EOF
  end
end
