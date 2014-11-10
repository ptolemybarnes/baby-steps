# PROBLEM 13: First ten digits of sum of 100 fifty digit numbers.

number = File.read("P013_Input.txt").gsub(" ","")
num_array = []
left = 0
right = 49

until right > 4999
	num_array.push number[left..right]
	left += 50
	right += 50
end

num_array = num_array.collect do |num|
	num[0..14].to_i
end

sum = num_array.inject{|sum, firstfifteen| sum + firstfifteen}

puts "The first ten digits of the sum of the one-hundred 50 digit numbers is #{sum.to_s[0..9]}."