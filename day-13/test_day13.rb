require "minitest/autorun"
require "./day13"

class TestDay13 < Minitest::Test
  def setup
    @solution = Year2020::Day13.new
  end

  def test_sample_part_1
    input = <<~EOF
      939
      7,13,x,x,59,x,31,19
    EOF

    assert_equal 295, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split

    assert_equal 2947, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
      939
      7,13,x,x,59,x,31,19
    EOF

    assert_equal 1068781, @solution.part2(input.split(/\n/))
  end

  def test_yt_sample
    input = <<~EOF
      939
      7,5,4,9,x,x,x,13
    EOF

    assert_equal 1866, @solution.part2(input.split(/\n/))
  end

  def test_tecosaur_sample
    input = <<~EOF
      939
      7,7,x,11,x,x,x,x,13
    EOF

    assert_equal 190, @solution.part2(input.split(/\n/))
  end

  def test_sample_part_2_1
    input = <<~EOF
      939
      17,x,13,19
    EOF

    assert_equal 3417, @solution.part2(input.split(/\n/))
  end

  def test_sample_part_2_2
    input = <<~EOF
      939
      67,7,59,61
    EOF

    assert_equal 754018, @solution.part2(input.split(/\n/))
  end

  def test_sample_part_2_3
    input = <<~EOF
      939
      67,x,7,59,61
    EOF

    assert_equal 779210, @solution.part2(input.split(/\n/))
  end

  def test_sample_part_2_4
    input = <<~EOF
      939
      67,7,x,59,61
      67,7,59,61
    EOF

    assert_equal 1261476, @solution.part2(input.split(/\n/))
  end

  def test_sample_part_2_5
    input = <<~EOF
      939
      1789,37,47,1889
    EOF

    assert_equal 1202161486, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split

    assert_equal 4242, @solution.part2(input)
  end
end
