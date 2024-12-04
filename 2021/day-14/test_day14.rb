require "minitest/autorun"
require "./day14"

class TestDay14 < Minitest::Test
  def setup
    @solution = Year2021::Day14.new
  end

  def test_sample_part_1_step_1
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

    # After step 1: NCNBCHB
    #"NCNBCHB".chars.tally
    # => {"N"=>2, "C"=>2, "B"=>2, "H"=>1}
    # assert_equal 1, @solution.part1(input.split(/\n/), 1)
    # After step 2: NBCCNBBBCBHCB
    # "NBCCNBBBCBHCB".chars.tally
    # => {"N"=>2, "B"=>6, "C"=>4, "H"=>1}
    assert_equal 5, @solution.part1(input.split(/\n/), 2)
    # After step 3: NBBBCNCCNBBNBNBBCHBHHBCHB
    # "NBBBCNCCNBBNBNBBCHBHHBCHB".chars.tally
    # => {"N"=>5, "B"=>11, "C"=>5, "H"=>4}
    assert_equal 7, @solution.part1(input.split(/\n/), 3)
    # After step 4: NBBNBNBBCCNBCNCCNBBNBBNBBBNBBNBBCBHCBHHNHCBBCBHCB
    # "NBBNBNBBCCNBCNCCNBBNBBNBBBNBBNBBCBHCBHHNHCBBCBHCB".chars.tally
    # => {"N"=>11, "B"=>23, "C"=>10, "H"=>5}
    assert_equal 18, @solution.part1(input.split(/\n/), 4)
  end

  def test_sample_part_1
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

    assert_equal 1588, @solution.part1(input.split(/\n/), 1)
  end

  def test_part_1
    skip
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
