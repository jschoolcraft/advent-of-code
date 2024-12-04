require "minitest/autorun"
require "./day18"

class TestDay18 < Minitest::Test
  def setup
    @solution = Year2021::Day18.new
  end

  def test_add
    assert_equal [[1,2],[[3,4],5]], @solution.add([1,2], [[3,4],5])
  end

  def test_reduce
    assert_equal [[[[0,9],2],3],4], @solution.reduce([[[[[9,8],1],2],3],4])
  end

  def test_magnitude
    skip
    assert_equal 143, @solution.magnitude([[1,2],[[3,4],5]])
    assert_equal 1384, @solution.magnitude([[[[0,7],4],[[7,8],[6,0]]],[8,1]])
    assert_equal 445, @solution.magnitude([[[[1,1],[2,2]],[3,3]],[4,4]])
    assert_equal 791, @solution.magnitude([[[[3,0],[5,3]],[4,4]],[5,5]])
    assert_equal 1137, @solution.magnitude([[[[5,0],[7,4]],[5,5]],[6,6]])
    assert_equal 3488, @solution.magnitude([[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]])
  end

  def test_sample_part_1
    input = <<~EOF
    EOF

    assert_equal 42, @solution.part1(input.split(/\n/))
  end

  def test_part_1
    input = File.read("./input.txt").split

    assert_equal 42, @solution.part1(input)
  end

  def test_sample_part_2
    input = <<~EOF
    EOF

    assert_equal 4242, @solution.part2(input.split(/\n/))
  end

  def test_part_2
    input = File.read("./input.txt").split

    assert_equal 4242, @solution.part2(input)
  end
end
