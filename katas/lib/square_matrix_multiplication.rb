# CodeWars Kata: http://www.codewars.com/kata/5263a84ffcadb968b6000513/train/ruby
# Write a method that multiplies two 2D-arrays to create a third. 

def matrix_multiply a, b
  a.each_with_index.map {|arr, idx| single_row arr, b }
end

# returns a single row of c.
def single_row a, b 
  a.each_with_index.map { |a_val, idx| single_fig a, b, idx }
end

# returns a single figure of c.
def single_fig a_row, b, row_number
  b_row = make_column_array b, row_number
  multiply_rows a_row, b_row
end

# multiplies two rows together to get a single figure.
def multiply_rows a, b
  a.each_with_index.map {|value, idx| a[idx] * b[idx]}.inject(:+)
end

#takes a 2D array and makes new arrays from its columns
def make_column_array arrays, col_num
  arrays.map {|row| row[col_num] }
end

=begin
To fill in cell [ i ][ j ] of matrix C, 
multiply the elements in the i'th row of matrix A by the elements in the j'th column of matrix B, 
then take the sum of all those products. 
This will give you the value for cell [ i ][ j ] in matrix C. 
=end
