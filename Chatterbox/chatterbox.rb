require './responses.rb'

def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample # the equals-tilde operator matches strings with regex. sample selects a random.
  /#{key}/ =~ input # checks if key matches input. (But why do this again?)
  response = RESPONSES[key]
	if response == "So when you say %{c1}, I should say %{c2}? Okay, got it!"
		RESPONSES[$1] = $2
	end
	response.nil? ? 'sorry?'.chatcol : response % {c1: $1, c2: $2, c3: $3}
end

class String # does colours.
	def chatcol
	"\e[31m" + self + "\e[0m"
	end
	def usercol
	"\e[34m" + self + "\e[0m"
	end
end

puts "Chatterbox: Hello, what's your name?".chatcol
print "User: ".usercol
name = gets.chomp
puts "Chatterbox: Hello #{name}".chatcol
exit = false
while !exit
  print "#{name}: ".usercol
  input = gets.chomp
  puts "Chatterbox: #{get_response(input)}".chatcol
  exit = true if input == "exit"
end

saved_responses = RESPONSES

file = open('./responses.rb', 'w')
file.write("RESPONSES = \n #{saved_responses}")
