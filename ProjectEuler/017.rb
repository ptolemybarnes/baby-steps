=begin 
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. 
The use of "and" when writing out numbers is in compliance with British usage.
=end

class Integer

	def to_eng(space=true)
		num_array = self.chunker(3, true)
		stringed_array = []
		chunk_particles = [nil,"thousand ","million ","billion "]
		chunk_count = 0

		num_array.reverse_each do |chunk|
			chunk_arr = []
			chunk_arr.unshift chunk_particles[chunk_count]
			
			hundreds = chunk[-3]; tens = chunk[-2]; singles = chunk[-1]; teens = chunk[-2..-1]
			if (10..19).include?(teens.to_i)
				if (10..12).include?(teens.to_i)
					irreg_teens = teens
				else 
					reg_teens = teens
				end
			end
			####
				if reg_teens
					if reg_teens == "14"
						chunk_arr.unshift "fourteen" # goddamn fourteen exception!
					else 
						chunk_arr.unshift get_string_hash(chunk[-1],-2) + "teen"
					end
				elsif irreg_teens
					chunk_arr.unshift get_string_hash(irreg_teens,-1,"irreg")
			# above for when first two digits (from right to left) are teens; below for when they are not.
				elsif singles
					chunk_arr.unshift get_string_hash(singles)
					if tens
						chunk_arr.unshift get_string_hash(tens,-2) + "ty" unless tens == "0"
					end
				end
			####

			if hundreds
				chunk_arr.unshift "and" unless teens == "00"
				chunk_arr.unshift get_string_hash(hundreds) + " hundred" if hundreds != "0"
			end

			stringed_array.unshift chunk_arr.join(" ")
			chunk_count += 1
		end

	stringed_array.join
	end

	def get_string_hash(number,pos=-1,type="reg")
		pos = -1 if pos < -2

		get_string_hash = {
			"reg" => {
						"1"=> ["ten","one"][pos],
						"2"=> ["twen","two"][pos],
						"3"=> ["thir","three"][pos],
						"4"=> ["for","four"][pos],
						"5"=> ["fif","five"][pos],
						"6"=> "six",
						"7"=> "seven",
						"8"=> ["eigh","eight"][pos],
						"9"=> "nine"
				},
			"irreg"=> {
						"10"=> "ten",
						"11"=> "eleven",
						"12"=> "twelve",
				}
			}
		get_string_hash[type][number]
	end

	def chunker(size,from_end=false)
	    output = self.to_s.reverse.scan(/.{1,#{size}}/).collect {|chunk| chunk.reverse}
	    from_end ? output.reverse : output
	end

end

super_string = ""
(1..1000).each {|val| super_string << val.to_eng}
puts super_string.gsub(" ","").length
