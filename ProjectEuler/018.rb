# Find the maximum total from top to bottom of the triangle below:

class Pyramid
attr_reader :print_sum_pyramid, :sum_pyramid


	def initialize(pyramid)
		@pyramid = pyramid
		@sum_pyramid = []
		@print_sum_pyramid = Proc.new {
			lineWidth = 100
			@sum_pyramid.each do |row|
				puts(row.join("---").center(lineWidth))
			end
		}
	end

	def make_sum_pyramid
		@pyramid.size.times {@sum_pyramid.push []}
		@sum_pyramid[-1] = @pyramid[-1]
		row = -2

		while @pyramid[row]
			@pyramid[row].each_index do |index|
				highest_child = @sum_pyramid[row+1][index] <=> @sum_pyramid[row+1][index+1]
				if highest_child == 1
					@sum_pyramid[row].push (@pyramid[row][index] + @sum_pyramid[row+1][index])
				else
					@sum_pyramid[row].push (@pyramid[row][index] + @sum_pyramid[row+1][index+1])
				end
			end
			row -= 1
		end
	end

	def get_highest_route
		route_record = [0]
		@sum_pyramid.each_index do |row_index|
			if @sum_pyramid[row_index+1]
				highest_position = (@sum_pyramid[row_index+1][route_record.last] <=> @sum_pyramid[row_index+1][(route_record.last)+1])
				if highest_position == 1
					route_record.push route_record.last
				else
					route_record.push route_record.last+1
				end
			end
		end
		route_record
	end

	def get_route_sum(route_record)
		sum_row = 0
		sum = 0
		route_record.each do |entry|
			sum += @pyramid[sum_row][entry]
			sum_row += 1
		end
		sum
	end

end

start_pyramid = 	[[75], # row 0
					[95,64],
					[17,47,82],
					[18,35,87,10],
					[20,4,82,47,65],
					[19,1,23,75,3,34],
					[88,2,77,73,7,63,67],
					[99,65,4,28,6,16,70,92],
					[41,41,26,56,83,40,80,70,33],
					[41,48,72,33,47,32,37,16,94,29],
					[53,71,44,65,25,43,91,52,97,51,14],
					[70,11,33,28,77,73,17,78,39,68,17,57],
					[91,71,52,38,17,14,91,43,58,50,27,29,48],
					[63,66,4,68,89,53,67,30,73,16,69,87,40,31],
					[04,62,98,27,23,9,70,98,73,93,38,53,60,4,23]]

pyramid = Pyramid.new(start_pyramid)
pyramid.make_sum_pyramid
pyramid.print_sum_pyramid.call
route_record = pyramid.get_highest_route
puts "The route with the highest sum produces the sum #{pyramid.get_route_sum(route_record)}"
