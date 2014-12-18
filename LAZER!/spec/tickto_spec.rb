require './lib/tickto'

describe 'tickto' do
  it 'can increase an integer by one towards another' do
    expect(1.tickto(3)).to eq(2)
  end
  it 'can decrease an integer by one towards another' do
    expect(3.tickto(1)).to eq(2)
  end
  it 'can increase a negative integer by one towards another' do
    expect(-2.tickto(1)).to eq(-1)
  end
  it 'can decrease a negative integer by one towards another' do
    expect(-2.tickto(-4)).to eq(-3)
  end
  it 'return self if self and target are the same' do
    expect(2.tickto 2).to eq(2)
  end
end

describe 'tickto for arrays' do
  it 'can take an array of numbers and tickto each of them towards a target array' do
    expect([1].tickto([3])).to eq([2])
    expect([1,5].tickto([3,7])).to eq([2,6])
    expect([10,5].tickto([2,7])).to eq([9,6])
  end
end