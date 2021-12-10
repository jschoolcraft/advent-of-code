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
    refute @solution.closes("[", nil)
    refute @solution.closes(">", nil)
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

  def test_close_line
    # assert_equal '}}]])})]'.chars, @solution.close_line('[({(<(())[]>[[{[]{<()<>>'.chars)
    # assert_equal ')}>]})'.chars, @solution.close_line('[(()[<>])]({[<{<<[]>>('.chars)
    # assert_equal '}}>}>))))'.chars, @solution.close_line('(((({<>}<{<{<>}{[]{[]{}'.chars)
    assert_equal ']]}}]}]}>'.chars, @solution.close_line('{<[[]]>}<{[{[{[]{()[[[]'.chars)
    # assert_equal '])}>'.chars, @solution.close_line('<{([{{}}[<[[[<>{}]]]>[]]'.chars)
  end

  def test_closing_score
    assert_equal 294, @solution.closing_score("])}>".chars)
    assert_equal 288957, @solution.closing_score("}}]])})]".chars)
    assert_equal 5566, @solution.closing_score(")}>]})".chars)
    assert_equal 1480781, @solution.closing_score("}}>}>))))".chars)
    assert_equal 995444, @solution.closing_score("]]}}]}]}>".chars)
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
    input = File.read("./input.txt").split

    assert_equal 4263222782, @solution.part2(input)
  end
end
