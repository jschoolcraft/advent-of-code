require "minitest/autorun"
require "./day04"

class TestDay04 < Minitest::Test
  def setup
    @solution = Year2020::Day04.new

    @input = <<~EOF
      ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
      byr:1937 iyr:2017 cid:147 hgt:183cm

      iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
      hcl:#cfa07d byr:1929

      hcl:#ae17e1 iyr:2013
      eyr:2024
      ecl:brn pid:760753108 byr:1931
      hgt:179cm

      hcl:#cfa07d eyr:2025 pid:166559648
      iyr:2011 ecl:brn hgt:59in
    EOF
  end

  def test_parse_passports
    assert_equal 4, @solution.parse_passports(@input.split(/\n/)).size

    input = File.open("./input.txt", "r").readlines.map(&:strip)
    assert_equal 260, @solution.parse_passports(input).size
  end

  def test_sample_part_1
    assert_equal 2, @solution.part1(@input.split(/\n/))
  end

  def test_part_1
    input = File.open("./input.txt", "r").readlines.map(&:strip)
    assert_equal 222, @solution.part1(input)
  end

  def test_validators
    assert @solution.valid?("byr", "2002")
    refute @solution.valid?("byr", "2003")
    refute @solution.valid?("byr", "foo")

    assert @solution.valid?("iyr", "2015")
    refute @solution.valid?("iyr", "2003")
    refute @solution.valid?("iyr", "2023")
    refute @solution.valid?("iyr", "foo")

    assert @solution.valid?("eyr", "2025")
    refute @solution.valid?("eyr", "2013")
    refute @solution.valid?("eyr", "2033")
    refute @solution.valid?("eyr", "foo")

    assert @solution.valid?("hgt", "60in")
    assert @solution.valid?("hgt", "190cm")
    refute @solution.valid?("hgt", "190in")
    refute @solution.valid?("hgt", "190")

    assert @solution.valid?("hcl", "#123abc")
    refute @solution.valid?("hcl", "#123abz")
    refute @solution.valid?("hcl", "123abc")

    assert @solution.valid?("ecl", "brn")
    assert @solution.valid?("ecl", "grn")
    refute @solution.valid?("ecl", "wat")
    refute @solution.valid?("ecl", "brn amb")

    assert @solution.valid?("pid", "000000001")
    assert @solution.valid?("pid", "123456789")
    refute @solution.valid?("pid", "0123456789")

    assert @solution.valid?("cid", "foo")
    assert @solution.valid?("cid", "f312351235")
    assert @solution.valid?("cid", "190in")
    assert @solution.valid?("cid", nil)
  end

  def test_sample_part_2
    assert_equal 2, @solution.part2(@input.split(/\n/))
  end

  def test_part_2
    input = File.open("./input.txt", "r").readlines.map(&:strip)

    assert_equal 140, @solution.part2(input)
  end
end
