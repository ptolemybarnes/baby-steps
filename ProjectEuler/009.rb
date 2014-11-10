# PROBLEM 9: PYTHAGOREAN TRIPLET. There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

top = 997 # this sets the C value.
middle = 2 # middle and bottom should always equal 1000 - top. 
bottom = 1 # bottom should not be equal/greater than top.

while true
return bottom+middle+top if (bottom**2 + middle**2 == top**2)
	until middle == (bottom + 1)
		bottom += 1
		middle -= 1 unless middle == (bottom + 1)
		return puts bottom*middle*top if (bottom**2 + middle**2 == top**2)
	end
# reset values and loop again with.
top -=1
middle = 1000 - top - 1
bottom = 1
end