require './lib/roman_numerals_decoder'

describe 'roman decoder' do
  
  it 'can decode roman numerals' do
    expect(roman_decoder("I")).to eq(1)
    expect(roman_decoder("XI")).to eq(11)
    expect(roman_decoder("XX")).to eq(20)
    expect(roman_decoder("XL")).to eq(40)
    expect(roman_decoder("CMXXXI")).to eq(931)
    expect(roman_decoder("MMCCCXXXIV")).to eq(2334)
  end

end

describe 'regular count' do

  it 'can find sum of regular roman numerals' do
    expect(count_regulars("MDCLV")).to eq 1655
  end
end

describe 'marginals remover' do
  
  it 'can remove irregulars from a string' do
    expect(remove_irregulars("MCMXC")).to eq("M")
    expect(remove_irregulars("MMCD")).to eq("MM")
  end

end

describe 'irregular counter' do
  
  it 'can count up the irregular and return the value' do
    expect(count_irregulars("MCMXC")).to eq(990)
    expect(count_irregulars("XL")).to eq 40
  end

end