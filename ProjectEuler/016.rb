=begin
2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
What is the sum of the digits of the number 2^1000?
=end

def sum_of_digits(power)
	number = (2**power).to_s.split("")
	number.inject(0) {|sum, val| sum + val.to_i}
end

puts sum_of_digits(1000)

