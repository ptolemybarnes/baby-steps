####### satisfies need to lazer things #######

class Array

	def lazer(mode="blast",strength=5)
		start = (self.length/2)-(self.length/strength/2)
		finish = (self.length/2)+(self.length/strength/2)

		effect= case mode
						when "blast"
						self[3..6].fill(" ")
						# when "stun"
						# self.each[start..finish].shuffle.join
					end
	end
end

puts [1,2,3,4,5,6,7,8,9].lazer.join(", ")
