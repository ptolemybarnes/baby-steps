def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2}
end

RESPONSES = { 'goodbye' => 'bye', 
              'sayonara' => 'sayonara', 
              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
              'I love (.*)' => 'I love %{c1} too', 
              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}',
              'How are you?' => "I'm #{["well", "great", "okay","sound as a pound"].sample}.",
              'The president of (.*) is (.*)' => "Sorry, but %{c1} deserves a better president than %{c2}.",
              'I want .*' => "Say please.",
              'What time is it?' => "THe time is #{Time.new}."

            }

puts "Hello, what's your name?"
name = gets.chomp
puts "Hello #{name}"

while() do
	print "#{name}:"
	input = gets.chomp
  puts "chatbox: " + get_response(input)
  break if input == "quit"
end