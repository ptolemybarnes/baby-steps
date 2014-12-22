require './lib/each'

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










