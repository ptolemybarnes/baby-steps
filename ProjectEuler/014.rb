# PROBLEM 14: Collatz numbers. Which starting number, under one million, produces the longest chain?

def collatz_length(start)
	collatz_array = [start,]
	n = start

	until collatz_array.last == 1
		if (n%2==0)
			collatz_array.push (n/2) 
		else 
			collatz_array.push ((n*3)+1)
		end
	n = collatz_array.last
	end
collatz_array.length
end

def longest_collatz(maximum)

	start = 1; longest_starter = 1; longest_starter_length = 1

	until start == maximum
		if collatz_length(start) > longest_starter_length
			longest_starter = start
			longest_starter_length = collatz_length(start)
		end
		start += 1
	end
puts "**********************"
"The starting number under #{maximum} that produces the longest collatz chain is #{longest_starter}, which produces a chain of #{longest_starter_length} terms."
end

maximum = 1_000_000
puts longest_collatz(maximum)