# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

class Integer

	def palindrome?
		num = self.to_s
		
		if
			num == num.reverse
			return true
		else
			false
		end

	end

end

numArray = []
palinArray = []
a = 999
b = 999

while (a > 99)
	if b < 100
		a = a - 1
		b = 999
	else
		numArray.push (a * b)
		b = b -1
	end
end

numArray.each do |num|
	if num.palindrome?
		palinArray.push num
	end
end

palinArray = palinArray.sort

puts 'The answer is ' + palinArray.last.to_s