require "minitest/autorun"
require "./day10"

class TestDay10 < Minitest::Test
  def setup
    @solution = Year2021::Day10.new
  end

  def test_closes
    assert @solution.closes("[", "]")
    assert @solution.closes("(", ")")
    assert @solution.closes("{", "}")
    assert @solution.closes("<", ">")

    refute @solution.closes("[", ")")
    refute @solution.closes("[", ">")
  end

  def test_sample_part_1
    input = <<~EOF
      [({(<(())[]>[[{[]{<()<>>
      [(()[<>])]({[<{<<[]>>(
      {([(<{}[<>[]}>{[]{[(<()>
      (((({<>}<{<{<>}{[]{[]{}
      [[<[([]))<([[{}[[()]]]
      [{[{({}]{}}([{[{{{}}([]
      {<[[]]>}<{[{[{[]{()[[[]
      [<(<(<(<{}))><([]([]()
      <{([([[(<>()){}]>(<<{{
      <{([{{}}[<[[[<>{}]]]>[]]
    EOF

    assert_equal 26397, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split

    assert_equal 392097, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      [({(<(())[]>[[{[]{<()<>>
      [(()[<>])]({[<{<<[]>>(
      {([(<{}[<>[]}>{[]{[(<()>
      (((({<>}<{<{<>}{[]{[]{}
      [[<[([]))<([[{}[[()]]]
      [{[{({}]{}}([{[{{{}}([]
      {<[[]]>}<{[{[{[]{()[[[]
      [<(<(<(<{}))><([]([]()
      <{([([[(<>()){}]>(<<{{
      <{([{{}}[<[[[<>{}]]]>[]]
    EOF

    assert_equal 288957, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    skip
    input = File.read("./input.txt").split

    assert_equal 4242, @solution.part2(input)
  end
end
