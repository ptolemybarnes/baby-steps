require './lib/fizzbuzz_sans_mod'

describe 'FizzBuzz' do

  it 'returns number as string if not divisible by 3 or 5' do
    expect(7.fizzbuzz).to eq('7')
  end

  it 'returns fizz if number is divisible by 3' do
    expect(6.fizzbuzz).to eq('Fizz')
  end

  it 'returns buzz if number is divisible by 5' do
    expect(10.fizzbuzz).to eq('Buzz')
  end

  it 'returns FizzBuzz if number is divisible by 15' do
    expect(15.fizzbuzz).to eq('FizzBuzz')
  end
end