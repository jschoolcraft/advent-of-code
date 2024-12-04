require "minitest/autorun"
require "./day<%= config[:day] %>"

class TestDay<%= config[:day] %> < Minitest::Test
  def setup
    @solution = Year<%= config[:year] %>::Day<%= config[:day] %>.new
  end

  def test_sample_part_1
    input = sample_data

    assert_equal 42, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.readlines("./input.txt")

    assert_equal 42, @solution.part1(input)
  end

  def test_sample_part_2
    input = sample_data

    assert_equal 4242, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.readlines("./input.txt")

    assert_equal 4242, @solution.part2(input)
  end

  def sample_data
    <<~EOF
    EOF
  end
end
