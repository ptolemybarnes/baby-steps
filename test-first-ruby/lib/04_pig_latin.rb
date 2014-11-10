def consonant_count(word)
i = 0
consonants = "bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ"
count = 0
	
	while word[i]
		if consonants.include?(word[i])
			if word[i..i.next] == "qu"
				count += 1
				i += 1
			end
			count +=1
			i += 1
		else return count
		end
	end
end



def translate(word)
vowels = "aeiouAEIOU"
consonants = "bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ"
word = word.split(" ")

word.collect! do |word|
	if word[0..1] == "qu"
		word = word[2..-1] + "quay"
	elsif vowels.include?(word[0])
	  word << "ay"
	else 
		word = word[consonant_count(word)..-1] + word[0...consonant_count(word)] + "ay"
	end
end

word.join(" ")
end


puts translate("Hello, Ptolemy")



