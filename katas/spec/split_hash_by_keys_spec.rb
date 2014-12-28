require './lib/split_hash_by_keys'

describe 'split' do
  it 'returns an array of hashes split by the given keys' do
    expect(split_hash_by_key( { :a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6 }, :c, :e  )).to eq([ {:a=>1, :b=>2}, {:c=>3, :d=>4}, {:e=>5, :f=>6} ])
    expect(split_hash_by_key( { :a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6 }, :b, :f  )).to eq([ {:a=>1}, {:b=>2, :c=>3, :d=>4, :e=>5}, {:f=>6} ])
    expect(split_hash_by_key( { 'a'=>1, 'b'=>2, 'c'=>3, 'd'=>4, 'e'=>5, 'f'=>6 },'d')).to eq([ {"a"=>1, "b"=>2, "c"=>3}, {"d"=>4, "e"=>5, "f"=>6} ])
    expect(split_hash_by_key( { :a => 1, :b => 2},                               :a )).to eq([ {:a => 1, :b => 2} ])
  end

  context 'when passed a splitter that is not a hash key' do
    it 'raises an error' do
      expect( lambda {split_hash_by_key( { :a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6 }, 'b' )}).to raise_error('One of the key given as argument is incorrect!')
    end
  end
end