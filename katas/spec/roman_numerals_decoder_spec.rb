require './lib/roman_numerals_decoder'

describe 'decoder' do

  it 'can decode the thousands' do
    expect(solution('M')).to eq(1000)
    expect(solution('MMM')).to eq(3000)
  end

  it 'can decode hundreds' do
    expect(solution('C')).to eq(100)
    expect(solution('D')).to eq(500)
    expect(solution('CM')).to eq(900)
  end
end