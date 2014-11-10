############## PROBLEM 11: What is the greatest product of four adjacent numbers in the same direction (up, down, left, right, or diagonally) in the 20×20 grid?

# This first section processes the data into a two-dimensional array (grid_array)

grid_array = "08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08 49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00 81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65 52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91 22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80 24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50 32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70 67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21 24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72 21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95 78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92 16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57 86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58 19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40 04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66 88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69 04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36 20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16 20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54 01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48"
grid_array = grid_array.gsub(" ","")
grid_array_processed = []
left = 0
right = left + 2
until grid_array_processed.length == 400
	grid_array_processed.push grid_array[left...right]
	left += 2
	right += 2
end
grid_array = grid_array_processed.map do |v|
	v == "00" ? "0" : v
	v[0] == "0" ? v[1] : v
	v = v.to_i
end
left = 0
right = 19
grid_array_rowed = []
20.times do
	grid_array_rowed.push [grid_array[left..right]]
	left += 20
	right += 20
end
grid_array = grid_array_rowed

# Find the largest multiple of 4 adjacent values along the rows.
left = 0
highest_value = 0
row = 0
until row == 20

	until left == 17
		value = grid_array[row][0][left]*grid_array[row][0][left+1]*grid_array[row][0][left+2]*grid_array[row][0][left+3]
			if value > highest_value
			highest_value = value
			puts "Highest value was found on row #{row}, starting at position #{left}"
			end
		left += 1
	end

row += 1
left = 0
end

puts "The highest value of the rows is #{highest_value}"

# Find the largest multiple of 4 adjacent values along the columns.
top = 0
column = 0
until column == 20

	until top == 17
		value = grid_array[top][0][column]*grid_array[top+1][0][column]*grid_array[top+2][0][column]*grid_array[top+3][0][column]
			if  value > highest_value
				highest_value = value
				puts "The highest value was found in column #{column+1} at position #{top+1}"
			end
		top += 1
	end

column += 1
top = 0
end

puts "The highest value of the rows and columns is #{highest_value}"

# Find the largest multiple of 4 adjacent values diagonally from north-west to south-west.

r = 0
c = 0

until c == 17

	until r == 17
		value = grid_array[r][0][c]*grid_array[r+1][0][c+1]*grid_array[r+2][0][c+2]*grid_array[r+3][0][c+3]
			if  value > highest_value
				highest_value = value
				puts "The highest value was found in column #{c+1} at position #{r+1}"
			end
		r += 1
	end

c += 1
r = 0
end

puts "The highest value of the rows, columns, and north-west to south-west diagonals is #{highest_value}"

# Find the largest multiple of 4 adjacent values diagonally from north-east to south-west.

r = 0
c = -1

until c == -16

	until r == 17
		value = grid_array[r][0][c]*grid_array[r+1][0][c-1]*grid_array[r+2][0][c-2]*grid_array[r+3][0][c-3]
			if  value > highest_value
				highest_value = value
				puts "The highest value was found in column #{c} at position #{r+1}"
			end
		r += 1
	end

c -=1
r = 0
end

puts "The highest value of the rows, columns, and north-west to south-west diagonals, and north east to south west is #{highest_value}"