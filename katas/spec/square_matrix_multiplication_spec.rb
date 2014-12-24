require './lib/square_matrix_multiplication'

describe 'square_matrix_multiplication' do

b = [[1,2,3],[5,6,7],[8,9,10]]

  it 'can multiply together two 2D arrays' do
    expect(matrix_multiply([[1, 2], [3, 2]], [[3, 2], [1, 1]])).to eq([[5, 4], [11, 8]])
  end

  describe 'matrix single row' do
    it 'can generate a single row of c from a and b' do
      expect(single_row([5,4,1], b)).to eq([33,43,53])
    end
  end

  describe 'matrix single fig' do
    it 'can generate a single fig of c from one row of a and b array' do
      expect(single_fig([5,4,1], b, 0)).to eq(33)
    end
  end

  describe 'mult_row' do
    it 'can multiple two arrays by each other' do
      expect(mult_row([1,2,3],[5,6,7])).to eq(38)
    end
  end

  describe 'make column into array' do
    it "can make an array from a column of a 2-D array" do
      expect(make_column_array([[1,2,3],[5,6,7],[8,9,10]], 0)).to eq([1,5,8])
    end
  end
end