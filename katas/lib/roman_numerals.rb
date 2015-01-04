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
  output << 'X' * (number/10)
  output << first_ten(number - ((number/10)*10))
end

def first_ten(number)
{0 => "", 1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 5 => 'V', 6 => 'VI', 7 => 'VII', 8 => 'VIII', 9 => 'IX', 10 => 'X'}[number]
end