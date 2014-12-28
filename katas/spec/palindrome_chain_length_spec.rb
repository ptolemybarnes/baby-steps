require './lib/palindrome_chain_length'

describe 'palindrome_chain_length' do

  it 'counts up the the chain length' do
    (expect(palindrome_chain_length(87))).to eq(4)
  end

  it 'checks if a number is a palindrome' do
    (expect(is_palindrome?(88))).to eq(true)
  end

  it 'adds the reverse number together' do
    expect(add_reverse(91)).to eq(110)
  end


end