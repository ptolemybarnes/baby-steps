# Write a method that can convert CamelCase to string_case.
# e.g., GetInTheChopper => get_in_the_chopper

def camel_to_snake(string)
  chopped_camel = string.to_s.split(/([A-Z](?:\d|[a-z])+)/).reject(&:empty?)
  chopped_camel.each_with_index.map {|word, idx| idx == 0 ? word.downcase : word.downcase.prepend('_') }.join
end

=begin
From CodeWars:

def to_underscore(string)
  string.to_s.split(/(?=[A-Z])/).join('_').downcase
end

=end

# Note: using "non-capture group" (?=) means that the string is split
# at the index of the matching value.

