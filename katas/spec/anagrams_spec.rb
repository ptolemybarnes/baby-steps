require './lib/anagrams'

describe 'anagrams' do

  it 'should return an array of all the anagrams of a word' do
    expect(anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada'])).to eq(['aabb', 'bbaa'])
  end

  it 'should return empty array if there are no anagrams' do
    expect(anagrams('laser', ['lazing', 'lazy',  'lacer'])).to eq([])
  end
end