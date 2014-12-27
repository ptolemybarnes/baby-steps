# Method takes two arguments: a base word and an array of possible anagrams
# Returns an array of the actual anagram.

def anagrams(baseword,anagrams)
  anagrams.map {|word| word if baseword.chars.sort == word.chars.sort }.compact
end