require './lib/prime_time'

describe 'prime_time' do

  it 'returns true if number is prime' do
    expect(is_prime?(13)).to eq(true)
    expect(is_prime?(10)).to eq(false)
  end

  it 'returns an array of the prime numbers up to a number' do
    expect(prime(11)).to eq([2,3,5,7,11])
  end
end