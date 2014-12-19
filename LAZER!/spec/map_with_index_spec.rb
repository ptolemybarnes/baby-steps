require './lib/map_with_index'

describe 'each' do
  context 'when called on an array of integers' do
    it 'should return the original integers with a number added' do
      array = [1,2,3,4,5]
      expect(array.each_special {|x| x + 1 }).to eq([2,3,4,5,6])
    end
  end
end

describe 'each_with_index_special' do
  context 'when called on an array of integers' do
    it 'should return the original integers with their index added to them' do
      array = [1,2,3,4,5]
      expect(array.each_with_index_special {|x, idx| x + idx}).to eq([1,3,5,7,9])
    end
  end
end

# describe 'map_with_index' do
#   context 'when called on an array of strings' do
#     it 'should return an array of strings with the original string and index number.' do
#       array = ['Zeroth','First','Second','Third','Fourth']
#       expect(array.map_with_index {|item, index| "#{item} at index #{index}" if item.length > 5 }).to eq(["Zeroth at index 0", nil, "Second at index 2", nil, "Fourth at index 4"])
#     end
#   end
# end

describe 'shoot' do
  context 'when called on an array of numbers with no argument' do
    it 'should return a sum of those numbers' do
      expect([1,2,3,4,5].shoot {|sum, value| sum + value}).to eq(15)
    end
  end
end