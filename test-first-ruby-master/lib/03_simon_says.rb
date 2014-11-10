def echo(string)
string
end

def shout(string)
string.upcase
end

def repeat(string,times=2)
string_array = []
	times.times do
		string_array.push string
	end
string_array.join(" ")
end

def start_of_word(string,num)
string[0..(num-1)]
end

def first_word(sentence)
sentence.split(" ")[0]
end

def titleize(word)
	if word.include?(" ")
	word = word.split(" ").collect {|word| word.capitalize}
	result = word.join(" ")
	else 
	result = word.capitalize
end
result
end

