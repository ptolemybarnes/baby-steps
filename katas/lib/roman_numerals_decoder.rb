# From: http://www.codewars.com/kata/51b6249c4612257ac0000005/train/ruby

REGULAR = {"I" => 1, "V" => 5, "X" => 10, "L"  => 50,
           "C"  => 100, "D" => 500, "M"  => 1000 }

IRREGULAR = {"IV" => 4, "IX" => 9,  "XL" => 40,
             "XC" => 90,"CD" => 400,"CM" => 900,}

def roman_decoder numerals
  sum      = 0
  sum     += count_irregulars numerals
  numerals = remove_irregulars numerals
  return sum if numerals.empty?
  sum     += count_regulars numerals
end

  def count_regulars numerals
    numerals.chars.map do |numeral|
      REGULAR[numeral]
    end.inject(:+)
  end

  def count_irregulars numerals
    sum = 0
    IRREGULAR.each do |irregular, int|
      sum += int if numerals.include? irregular
    end
    sum
  end

  def remove_irregulars numerals
    IRREGULAR.keys.each do |irregular|
      numerals.gsub!(irregular, "")
    end
    numerals
  end