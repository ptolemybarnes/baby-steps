# Find the maximum total from top to bottom of the triangle below:

class Pyramid
attr_reader :print_sum_pyramid, :sum_pyramid


	def initialize(pyramid)
		@pyramid = pyramid
		@sum_pyramid = []
		@print_sum_pyramid = Proc.new {
			lineWidth = 100
			@sum_pyramid.each {|row| puts(row.join("---").center(lineWidth))}
		}
	end

	def make_sum_pyramid
		@pyramid.size.times {@sum_pyramid.push []}
		@sum_pyramid[-1] = @pyramid[-1]
		row = -2
		while @pyramid[row]
			@pyramid[row].each_index do |index|
				@sum_pyramid[row].push (@pyramid[row][index] + [@sum_pyramid[row.next][index], @sum_pyramid[row.next][index.next]].max)
			end
			row -= 1
		end
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
puts "The route with the highest sum produces the sum #{pyramid.sum_pyramid[0][0]}"