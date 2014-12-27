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
  get_ip_value(ending) - get_ip_value(start)
end

def get_ip_value ip
  ip = ip.split('.')
  ip.reverse.each_with_index.map {|num, idx| num.to_i * (256**idx)}.inject(:+)
end