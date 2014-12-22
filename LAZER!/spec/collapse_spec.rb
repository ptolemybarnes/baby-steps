require './lib/collapse'

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

    it 'can find the longest of the strings' do
      array = ["cat", "sheep", "bear"]
      expect(array.inject { |memo,word| memo.length > word.length ? memo : word }).to eq(array.collapse { |memo,word| memo.length > word.length ? memo : word })
    end
  end

  context 'when called with proc argument on numbers' do
    it 'should return sum/product of those numbers' do
      array = [1,2,3,4,5]
      expect(array.collapse(&:+)).to eq(array.inject(:+))
      expect(array.collapse(&:*)).to eq(array.inject(:*))
      expect(array.collapse(10, &:*)).to eq(array.inject(10, :*))
    end
  end

  context 'when called with method/symbol shorthand on numbers' do
    it 'should return a sum/product of those numbers' do
      array = [1,2,3,4,5]
      expect(array.collapse(10, :*)).to eq(array.inject(10, :*))
      expect(array.collapse(:*)).to eq(array.inject(:*))
    end
  end

  context 'when called with method/symbol shorthand on floats' do
    it 'should return a sum/product of those floats' do
      array = [1.1,2.3,3.5,4.7,5.9]
      expect(array.collapse(10.6, :*)).to eq(array.inject(10.6, :*))
      expect(array.collapse(:*)).to eq(array.inject(:*))
    end
  end
end