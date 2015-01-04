require './lib/roman_numerals'

# describe 'roman numerals' do

#   it 'can return numbers 1 through 10' do
#     expect(first_ten(1)).to eq('I')
#     expect(first_ten(2)).to eq('II')
#     expect(first_ten(3)).to eq('III')
#     expect(first_ten(4)).to eq('IV')
#     expect(first_ten(5)).to eq('V')
#     expect(first_ten(6)).to eq('VI')
#     expect(first_ten(7)).to eq('VII')
#     expect(first_ten(8)).to eq('VIII')
#     expect(first_ten(9)).to eq('IX')
#     expect(first_ten(10)).to eq('X')
#   end

#   it 'can do teens' do
#     expect(roman_numerals(11)).to eq('XI')
#     expect(roman_numerals(16)).to eq('XVI')
#   end

#   it 'can do 10, 20, 30 etc' do
#     expect(roman_numerals(20)).to eq('XX')
#     expect(roman_numerals(30)).to eq('XXX')
#     expect(roman_numerals(40)).to eq('XV')
#   end