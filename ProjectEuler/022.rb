####################### P R O B L E M - 22 ################################################
#
# Using names.txt begin by sorting it into alphabetical order. 
# Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. 
# So, COLIN would obtain a score of 938 × 53 = 49714.
# What is the total of all the name scores in the file?	

names = File.read('./022_names.txt')
names = names.split(",").collect {|name| name.delete "\""}.sort # removes all apostrophes.
sum = 0



class String
	def get_alpha_val
		self.split("").inject(0){|sum, char| sum + (char.ord-64)}
	end
end


names.each_with_index do |name, idx|
	sum += name.get_alpha_val * (idx+1)
end

puts sum