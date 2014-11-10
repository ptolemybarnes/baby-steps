# Find the difference between the sum of the squares of the first one hundred natural numbers 
# and the square of the sum.

# ([*1..100].inject{|sum, n| sum + n} ** 2) - ([*1..100].inject{|sum, n| sum + n**2})


###########################################################################
# PROBLEM 7: What is the 10 001st prime number?
# def is_prime?(num)
# (2..(Math.sqrt(num).to_i)).each {|div| return false if (num % div == 0)}
# true
# end

# prime_array = [2]
# num = 3
# until prime_array.length == 10_001
# prime_array.push num if is_prime?(num)		
# num += 2
# end
# puts "The 10,001st prime number is #{prime_array[-1]}."
###########################################################################

# PROBLEM 8: Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. 
# What is the value of this product?

# thou_digit = 7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450

# left_cursor = 0
# right_cursor = left_cursor + 13
# highest_sum = 0

# until right_cursor > 1000
# 	unless thou_digit.to_s[left_cursor...right_cursor].include? "0"
# 		sum = thou_digit.to_s[left_cursor...right_cursor].split("").inject(1) {|sum, v| sum.to_i * v.to_i}
# 		highest_sum = sum unless highest_sum > sum
# 	end
# 	left_cursor = left_cursor-1
# 	right_cursor = right_cursor-1
# end

# puts "The answer is #{highest_sum}."

###########################################################################
# PROBLEM 9: PYTHAGOREAN TRIPLET. There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

# top = 997 # this sets the C value.
# middle = 2 # middle and bottom should always equal 1000 - top. 
# bottom = 1 # bottom should not be greater than top.

# while true
# return bottom+middle+top if (bottom**2 + middle**2 == top**2)
# 	until middle == (bottom + 1)
# 		bottom += 1
# 		middle -= 1 unless middle == (bottom + 1)
# 		return puts bottom*middle*top if (bottom**2 + middle**2 == top**2)
# 		puts "top: #{top}. middle: #{middle}. bottom: #{bottom}"
# 	end
# # reset values and loop again with.
# top -=1
# middle = 1000 - top - 1
# bottom = 1
# end

###########################################################################
# PROBLEM 10: Summation of primes. Find the sum of all the primes below 2 million.

# def is_prime?(num)
# (2..(Math.sqrt(num).to_i)).each {|div| return false if (num % div == 0)}
# true
# end

# prime_array = [2]
# num = 3
# until prime_array.last > 2_000_000
# prime_array.push num if is_prime?(num)		
# num += 2
# end
# prime_array.pop
# puts prime_array.inject(:+)

###########################################################################
# PROBLEM 11: Largest product in grid

#This first section processes the data into a two-dimensional array (grid_array)
# grid_array = "08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08 49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00 81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65 52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91 22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80 24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50 32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70 67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21 24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72 21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95 78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92 16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57 86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58 19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40 04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66 88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69 04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36 20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16 20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54 01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48"
# grid_array = grid_array.gsub(" ","")
# grid_array_processed = []
# left = 0
# right = left + 2
# until grid_array_processed.length == 400
# 	grid_array_processed.push grid_array[left...right]
# 	left += 2
# 	right += 2
# end
# grid_array = grid_array_processed.map do |v|
# 	v == "00" ? "0" : v
# 	v[0] == "0" ? v[1] : v
# 	v = v.to_i
# end
# left = 0
# right = 19
# grid_array_rowed = []
# 20.times do
# 	grid_array_rowed.push [grid_array[left..right]]
# 	left += 20
# 	right += 20
# end
# grid_array = grid_array_rowed

# # Find the largest multiple of 4 adjacent values along the rows.
# left = 0
# highest_value = 0
# row = 0
# until row == 20

# 	until left == 17
# 		value = grid_array[row][0][left]*grid_array[row][0][left+1]*grid_array[row][0][left+2]*grid_array[row][0][left+3]
# 			if value > highest_value
# 			highest_value = value
# 			puts "Highest value was found on row #{row}, starting at position #{left}"
# 			end
# 		left += 1
# 	end

# row += 1
# left = 0
# end

# puts "The highest value of the rows is #{highest_value}"

# # Find the largest multiple of 4 adjacent values along the columns.
# top = 0
# column = 0
# until column == 20

# 	until top == 17
# 		value = grid_array[top][0][column]*grid_array[top+1][0][column]*grid_array[top+2][0][column]*grid_array[top+3][0][column]
# 			if  value > highest_value
# 				highest_value = value
# 				puts "The highest value was found in column #{column+1} at position #{top+1}"
# 			end
# 		top += 1
# 	end

# column += 1
# top = 0
# end

# puts "The highest value of the rows and columns is #{highest_value}"

# # Find the largest multiple of 4 adjacent values diagonally from north-west to south-west.

# r = 0
# c = 0

# until c == 17

# 	until r == 17
# 		value = grid_array[r][0][c]*grid_array[r+1][0][c+1]*grid_array[r+2][0][c+2]*grid_array[r+3][0][c+3]
# 			if  value > highest_value
# 				highest_value = value
# 				puts "The highest value was found in column #{c+1} at position #{r+1}"
# 			end
# 		r += 1
# 	end

# c += 1
# r = 0
# end

# puts "The highest value of the rows, columns, and north-west to south-west diagonals is #{highest_value}"

# # Find the largest multiple of 4 adjacent values diagonally from north-east to south-west.

# r = 0
# c = -1

# until c == -16

# 	until r == 17
# 		value = grid_array[r][0][c]*grid_array[r+1][0][c-1]*grid_array[r+2][0][c-2]*grid_array[r+3][0][c-3]
# 			if  value > highest_value
# 				highest_value = value
# 				puts "The highest value was found in column #{c} at position #{r+1}"
# 			end
# 		r += 1
# 	end

# c -=1
# r = 0
# end

# puts "The highest value of the rows, columns, and north-west to south-west diagonals, and north east to south west  is #{highest_value}"

###########################################################################
# PROBLEM 12: What is the value of the first triangle number to have over 500 divisors?

# class Integer
#   def factors()
#     1.upto(Math.sqrt(self)).select {|i| (self % i).zero?}.inject([]) do |f, i| 
#       f << i
#       f << self/i unless i == self/i
#       f
#     end.sort
#   end
# end

# def tri_num_divisors(target)
# 	tri_count = 1
# 	tri_num = 0
# 	div_count = 0

# 	loop do
# 	tri_num = tri_count + tri_num 
# 	break if tri_num.factors.length > target
# 	tri_count += 1
# 	end

# 	puts "The first triangle number with over #{target} divisors is #{tri_num}, which has #{tri_num.factors.length} divisors."
# end

# tri_num_divisors(500)

# The following processes the data

# PROBLEM 13: First ten digits of sum of 100 fifty digit numbers.

# number = File.read("ProjectEuler/input.txt").gsub(" ","")
# num_array = []
# left = 0
# right = 49

# until right > 4999
# 	num_array.push number[left..right]
# 	left += 50
# 	right += 50
# end

# num_array = num_array.collect do |num|
# 	num[0..14].to_i
# end

# puts num_array.inject{|sum, firstfifteen| sum + firstfifteen}

# puts 5537376230.to_s.length

# PROBLEM 14: Collatz numbers. Which starting number, under one million, produces the longest chain?

# def collatz_length(start)
# 	collatz_array = [start,]
# 	n = start

# 	until collatz_array.last == 1
# 		if (n%2==0)
# 			collatz_array.push (n/2) 
# 		else 
# 			collatz_array.push ((n*3)+1)
# 		end
# 	n = collatz_array.last
# 	end
# collatz_array.length
# end

# def longest_collatz(maximum)

# 	start = 1; longest_starter = 1; longest_starter_length = 1

# 	until start == maximum
# 		if collatz_length(start) > longest_starter_length
# 			longest_starter = start
# 			longest_starter_length = collatz_length(start)
# 		end
# 		start += 1
# 	end
# puts "**********************"
# "The starting number under #{maximum} that produces the longest collatz chain is #{longest_starter}, which produces a chain of #{longest_starter_length} terms."
# end

# maximum = 1_000_000
# puts longest_collatz(maximum)

# PROBLEM 15: How many routes are there through a 20x20 grid?

def grid_routes(size)
	
	

end

# puts grid_routes(2)




