=begin
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. 
The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
=end

class Integer
  def is_proper_divisor?(dividend)
  	(dividend.to_f/self.to_f) == dividend/self
  end

  def get_proper_divisors
  	divisor_array = []
  	1.upto(self/2) {|div| divisor_array.push div if div.is_proper_divisor?(self)}
  	divisor_array
	end

	def has_amicable_pair?
		sum_of_divisors = self.get_proper_divisors.reduce(:+)
		if (sum_of_divisors.get_proper_divisors.reduce(:+) == self) && (sum_of_divisors != self)
			[self, sum_of_divisors]
		else 
			false
		end
	end
	
end

puts 2.upto(10000).select {|v| v.has_amicable_pair?}.inject(:+)

