require './lib/map_with_index'

describe 'each' do
  context 'when called on an array of integers' do
    it 'should return the original integers with a number added' do
      array = [1,2,3,4,5]
      expect(array.each_special {|x| x + 1 }).to eq([2,3,4,5,6])
    end
  end
end

# describe 'map_with_recursion' do
#   context 'when called on an array of integers' do
#     it 'should return the original integers with a number added' do
#       array = [1,2,3,4,5]
#       expect(array.map_with_recursion {|x| x + 1 }).to eq(array.map { |x| x + 1 })
#     end
#   end
# end

describe 'each_with_index_special' do
  context 'when called on an array of integers' do
    it 'should return the original integers with their index added to them' do
      array = [1,2,3,4,5]
      expect(array.each_with_index_special {|x, idx| x + idx}).to eq([1,3,5,7,9])
    end
  end
end

describe 'collapse' do
  context 'when called on an array of numbers with no argument' do
    it 'should return a sum of numbers' do
      array = [1,2,3,4,5]
      expect(array.collapse {|sum, value| sum + value}).to eq(array.inject {|sum, value| sum + value})
    end
    it 'should return a subtraction of numbers' do
      array = [1,2,3,4,5]
      expect(array.collapse {|sum, value| sum - value}).to eq(array.inject {|sum, value| sum - value})
    end
  end

  context 'when called on an array of numbers with an argument' do
    it 'should return a sum of those numbers' do
      array = [1,2,3,4,5]
      expect(array.collapse(10) {|sum, value| sum + value}).to eq(array.inject(10) {|sum, value| sum + value})
    end
  end

  context 'when called on an array of strings' do
    it 'should concatenate the strings' do
      expect(["one","two","three"].collapse {|collector, string| collector + string}).to eq(["one","two","three"].inject {|collector, string| collector + string})
    end
  end

  context 'when called with method/block shorthand on numbers' do
    it 'should return a sum/product of those numbers' do
      array = [1,2,3,4,5]
      expect(array.collapse(&:+)).to eq(array.inject(:+))
      expect(array.collapse(&:*)).to eq(array.inject(:*))
      expect(array.collapse(10, &:*)).to eq(array.inject(10, :*))
    end
  end

  context 'when called with block shorthand on numbers' do
    it 'should return a sum/product of those numbers' do
      array = [1,2,3,4,5]
      expect(array.collapse(10, :*)).to eq(array.inject(10, :*))
      expect(array.collapse(:*)).to eq(array.inject(:*))
    end
  end

end










