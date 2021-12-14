require "minitest/autorun"
require "./day14"

class TestDay14 < Minitest::Test
  def setup
    @solution = Year2021::Day14.new
  end

  def test_sample_part_1
    input = <<~EOF
      NNCB

      CH -> B
      HH -> N
      CB -> H
      NH -> C
      HB -> C
      HC -> B
      HN -> C
      NN -> C
      BH -> H
      NC -> B
      NB -> B
      BN -> B
      BB -> N
      BC -> B
      CC -> N
      CN -> C
    EOF

    assert_equal 1588, @solution.part1(input.split(/\n/), 10)
  end

  def test_part_1
    input = File.read("./input.txt").split(/\n/)

    assert_equal 3118, @solution.part1(input, 10)
  end

  def test_sample_part_2
    skip
    input = <<~EOF
      NNCB

      CH -> B
      HH -> N
      CB -> H
      NH -> C
      HB -> C
      HC -> B
      HN -> C
      NN -> C
      BH -> H
      NC -> B
      NB -> B
      BN -> B
      BB -> N
      BC -> B
      CC -> N
      CN -> C
    EOF

    assert_equal 2188189693529, @solution.part2(input.split(/\n/), 40)
  end

  def test_part_2
    skip
    input = File.read("./input.txt").split(/\n/)

    assert_equal 4242, @solution.part2(input, 40)
  end
end
