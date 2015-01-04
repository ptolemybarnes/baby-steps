=begin
Create a function taking a positive integer as its parameter and returning a
 string containing the Roman Numeral representation of that integer.

Modern Roman numerals are written by expressing each digit separately 
starting with the left most digit and skipping any digit with a value of zero.
 In Roman numerals 1990 is rendered: 1000=M, 900=CM, 90=XC; resulting in MCMXC.
  2008 is written as 2000=MM, 8=VIII; or MMVIII. 
  1666 uses each Roman symbol in descending order: MDCLXVI.
=end

def roman_numerals number
  output = ""
  number = number.to_s.chars.map {|char| char.to_i}
  output.prepend first_ten(number[-1]) if number[-1]
  output.prepend tens(number[-2]) if number[-2]
  output.prepend hundreds(number[-3]) if number[-3]
  output.prepend thousands(number[-4]) if number[-4]
  output
end

def first_ten(number)
["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"][number]
end

def tens(number)
["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"][number]
end

def hundreds(number)
["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"][number]
end

def thousands(number)
'M' * number
end