# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

class Integer

	def div20?
		goodAnswer = true
		divisor = 1
		while (goodAnswer == true) and (divisor <= 20)
			if self/divisor == self.to_f/divisor.to_f
				divisor = divisor + 1
			else
				goodAnswer = false
			end
		end
		goodAnswer
	end
end

num = 20

while num.div20? == false
	num = num + 20
end

puts 'The answer is ' + num.to_s + '.'






