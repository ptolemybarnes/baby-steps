require './lib/changemachine'

describe 'changemachine' do

  context 'when given a value greater than 0' do
    it 'should return the optimal set of coins totalling the given value' do
      expect(changemachine(31)).to eq({ 25 => 1, 10 => 0, 5 => 1, 1 => 1 })
    end
  end

  context 'when given 0 as value' do
    it 'should return hash with all coins having value of 0' do
      expect(changemachine(0)).to eq({ 25 => 0, 10 => 0, 5 => 0, 1 => 0 })
    end
  end

  context 'when given a negative as value' do
    it 'should return hash with all coins having value of 0' do
      expect(changemachine(-10)).to eq({ 25 => 0, 10 => 0, 5 => 0, 1 => 0 })
    end
  end
end