def solution numerals
  output   = 0
  numerals = numerals.chars
  output += numerals.select {|char| char == 'M'}.count * 1000
  output += numerals.select {|char| char == 'C'}.count * 100
  output += numerals.select {|char| char == 'D'}.count * 500
end