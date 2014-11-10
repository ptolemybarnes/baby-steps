# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

num = 0 
array = []
while num < 1000
	if num.to_f/3.0 == (num/3).to_f
		array.push num
	else
		if num.to_f/5.0 == (num/5).to_f
		array.push num
		end
	end
	num = num + 1
end
total = 0
array.each do |number|
	total = total + number
end

puts total