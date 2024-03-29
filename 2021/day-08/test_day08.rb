require "minitest/autorun"
require "./day08"

class TestDay08 < Minitest::Test
  def setup
    @solution = Year2021::Day08.new
  end

  def test_sample_part_1
    input = <<~EOF
      be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
      edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
      fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
      fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
      aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
      fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
      dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
      bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
      egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
      gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce
    EOF

    assert_equal 26, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split(/\n/)

    assert_equal 274, @solution.part1(input)
  end

  def test_find_numbers
    numbers = @solution.find_numbers("acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab ")

    assert_equal "cagedb".chars.sort.join, numbers[0]
    assert_equal "ab".chars.sort.join, numbers[1]
    assert_equal "gcdfa".chars.sort.join, numbers[2]
    assert_equal "fbcad".chars.sort.join, numbers[3]
    assert_equal "eafb".chars.sort.join, numbers[4]
    assert_equal "cdfbe".chars.sort.join, numbers[5]
    assert_equal "cdfgeb".chars.sort.join, numbers[6]
    assert_equal "dab".chars.sort.join, numbers[7]
    assert_equal "acedgfb".chars.sort.join, numbers[8]
    assert_equal "cefabd".chars.sort.join, numbers[9]
  end

  def test_process_output
    input = "acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf"
    assert_equal 5353, @solution.process_output(input)
    input = "be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe"
    assert_equal 8394, @solution.process_output(input)
    input = "edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc"
    assert_equal 9781, @solution.process_output(input)
    input = "fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg"
    assert_equal 1197, @solution.process_output(input)
    input = "fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb"
    assert_equal 9361, @solution.process_output(input)
    input = "aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea"
    assert_equal 4873, @solution.process_output(input)
    input = "fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb"
    assert_equal 8418, @solution.process_output(input)
    input = "dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe"
    assert_equal 4548, @solution.process_output(input)
    input = "bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef"
    assert_equal 1625, @solution.process_output(input)
    input = "egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb"
    assert_equal 8717, @solution.process_output(input)
    input = "gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce"
    assert_equal 4315, @solution.process_output(input)
  end

  def test_sample_part_2
    input = <<~EOF
      be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
      edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
      fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
      fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
      aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
      fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
      dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
      bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
      egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
      gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce
    EOF

    assert_equal 61229, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split(/\n/)

    assert_equal 1012089, @solution.part2(input)
  end
end
