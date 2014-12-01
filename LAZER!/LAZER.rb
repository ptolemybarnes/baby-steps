####### satisfies need to lazer things #######

class String

	def lazer(mode="blast")
		self.length/5 > 0 ? scope = self.length/5 : scope = 1
		fillmode = case mode
							 when "blast"
							 	[" "]
							 when "stun"
							 	self.chars[length/2-scope/2..length/2+scope/2]
							 end
		self.chars.fill(fillmode.sample,self.length/2-scope/2,scope).join
	end

end

