# CodeWars Kata: http://www.codewars.com/kata/5263a84ffcadb968b6000513/train/ruby
# Write a method that multiplies two 2D-arrays to create a third. 

def matrix_multiply a, b
  a.each_with_index.map do |arr, idx|
    single_row arr, b
  end
end

def single_row a, b
  c_row = []
  a.size.times do |idx| 
    c_row.push single_fig a, b, idx
  end
  c_row
end

def single_fig a, b, row_number
  b = make_column_array b, row_number
  mult_row a, b
end

def mult_row a, b
  products = []
  a.each_with_index {|value, idx| products << a[idx] * b[idx]}
  products.inject(:+)
end

def make_column_array arrays, col
  column = []
  arrays.each do |row|
    column.push row[col]
  end
column
end

=begin
To fill in cell [ i ][ j ] of matrix C, 
multiply the elements in the i'th row of matrix A by the elements in the j'th column of matrix B, 
then take the sum of all those products. 
This will give you the value for cell [ i ][ j ] in matrix C. 
=end
