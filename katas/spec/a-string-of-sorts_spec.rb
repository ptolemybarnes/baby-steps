require 'a-string-of-sorts'

describe 'a_string_of_sorts' do

  it 'can return a string sorted by another string' do
    expect(a_string_of_sorts('banana', 'abn')).to eq('aaabnn')
    expect(a_string_of_sorts('foos', 'of')).to eq('oofs')
  end

  it 'returns the same string if sort string is empty' do
    expect(a_string_of_sorts('banana', '')).to eq('banana')
  end
end

describe 'sort_string' do

  it 'can return a string sorted by another string' do
    expect(sort_string('banana', 'abn')).to eq('aaabnn')
    expect(sort_string('foos', 'of')).to eq('oofs')
  end

  it 'returns the same string if sort string is empty' do
    expect(sort_string('banana', '')).to eq('banana')
  end
end