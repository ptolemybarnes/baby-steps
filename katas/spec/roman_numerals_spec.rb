require './lib/roman_numerals'

describe 'roman numerals' do

  it 'can do teens' do
    expect(roman_numerals(11)).to eq('XI')
    expect(roman_numerals(16)).to eq('XVI')
  end

  it 'can do 10, 20, 30 etc' do
    expect(roman_numerals(20)).to eq('XX')
    expect(roman_numerals(30)).to eq('XXX')
    expect(roman_numerals(40)).to eq('XL')
  end

  it 'can do hundreds' do
    expect(roman_numerals(100)).to eq('C')
    expect(roman_numerals(600)).to eq('DC')
  end

  it 'can do numbers inbetween' do
    expect(roman_numerals(251)).to eq('CCLI')
  end

end