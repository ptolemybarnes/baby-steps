=begin 
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. 
The use of "and" when writing out numbers is in compliance with British usage.
=end

class Integer

def to_eng(space=true)
num = self.to_s
num_array = []
selector = -1
aand = true

	while num[selector]
		unless num[selector] == 0
			if selector < -2 && aand
				num_array.unshift "and"
				num_array.unshift " " if space
				aand = false
			end
			num_array.unshift place_stringer(selector,num)
			num_array.unshift under_ten_string(num[selector],selector)
		end
		num_array.unshift " " if space
		selector -= 1
	end

num_array.join("")
end

def place_stringer(selector, num)
place_string = "ty" if (selector == -2 && num[selector] > "1")
place_string = "hundred" if (selector == -3 && num[selector] != "0")
place_string = "thousand" if selector == -4
place_string ||= ""
end

def under_ten_string(number,pos=-1)
pos = -1 if pos < -2
case number
	when "1"
		["ten","one"][pos]
	when "2"
		["twen","two"][pos]
	when "3"
		["thir","three"][pos]
	when "4"
		["for","four"][pos]
	when "5"
		["fif","five"][pos]
	when "6"
		"six"
	when "7"
		"seven"
	when "8"
		["eigh","eight"][pos]
	when "9"
		"nine"
	end
end

end

1001.times do |num|
puts "#{num}: #{num.to_eng(true)}"
end

