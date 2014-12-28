=begin 
# From CodeWars: http://www.codewars.com/kata/52d0f9bc48155f574c0001b7/train/ruby
Write a method which takes arguments:

hash
keys (comma-separated symbols or strings)
and it splits hash by given keys and returns array of hashes.

If a key given as an argument is not present in the hash,
the method should raise an exception

In case there are any empty hash after splitting,
it should be removed from resultant array.

For example:
# returns [ {:a=>1, :b=>2}, {:c=>3, :d=>4}, {:e=>5, :f=>6} ]
split_hash_by_key( { :a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6 }, :c, :e )
=end

def split_hash_by_key hash, *splitters
  raise 'One of the key given as argument is incorrect!' unless all_splitters_present? hash, splitters
  hash.slice_before {|key,v| splitters.include?(key) }.map {|slice| Hash[slice]}
end

def all_splitters_present? hash, splitters
  splitters.all? {|splitter| hash.keys.include?(splitter) }
end