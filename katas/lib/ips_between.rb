# From: http://www.codewars.com/kata/526989a41034285187000de4/train/ruby

=begin
Write a function that accepts a starting and ending IPv4 address, 
and returns the number of IP addresses from start to end, 
excluding the end IP address. 
All input to the ipsBetween function will be valid IPv4 addresses
 in the form of strings. The ending address will be at least one 
 address higher than the starting address. 
=end

def ipsBetween(start, ending)
  start       = start.split('.').map {|val| val.to_i }
  start_total = start[3]
  start_total+= start[2] * 256
  start_total+= start[1] * 256 * 256
  start_total+= start[0] * 256 * 256 * 256

  ending       = ending.split('.').map {|val| val.to_i }
  ending_total = ending[3]
  ending_total+= ending[2] * 256
  ending_total+= ending[1] * 256 * 256
  ending_total+= ending[0] * 256 * 256 * 256

  ending_total - start_total
end