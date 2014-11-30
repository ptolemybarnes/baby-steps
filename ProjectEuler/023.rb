=begin	
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. 
For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. 
By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. 
However, this upper limit cannot be reduced any further by analysis even though
it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.	
=end

class Integer

def is_proper_divisor?(dividend)
  	(dividend.to_f/self.to_f) == dividend/self
  end

  def abundant_num?
	  div_sum = 0
	  	
  	root = Math.sqrt(self)
  	if (root**2) == (root.to_i**2) # ensures root is not added twice if perfect root
  		div_sum += root.to_i
  		root -= 1
  	end
  	
  	2.upto(root) do |div| 
  		div_sum += (div + self/div) if div.is_proper_divisor?(self)
  	end

  	div_sum > self
	end

end

# 1) find all abundant numbers 12 through (28123 - 12). 
# 2) Find every possible sum < 28123
# 3) Then subtract this set from the range of numbers 1 through 28123 to get set of numbers that are not sums of abundant numbers.
# 4) Sum this diminished set.

abund_num_arr = []

12.upto(28123) do |num|
	abund_num_arr.push num if num.abundant_num?
end

abund_num_sums = []
base = 0
add = base

while abund_num_arr[add]
	until abund_num_arr[base] + abund_num_arr[add] > 28123
		abund_num_sums.push abund_num_arr[base] + abund_num_arr[add]
		add += 1
	end
	base += 1
	add = base
end

non_abund_composites = (1..28123).to_a - abund_num_sums
puts non_abund_composites.reduce(:+)
