# CodeWars Kata: http://www.codewars.com/kata/52ae2db783f47875d0000064/train/ruby
# Write a method that captures words prefixed by hashtags.

def get_hashtags(string)
  string.prepend(" ")
  string = string.split(/ #+/)
  string.reject! {|string| string[0] == " " }
  string.reject! {|string| string.include?('#')}
  string.map!    {|string| string.include?(' ') ? string[0..string.index(" ")] : string}
  string.map!    {|string| string.rstrip }
  string.reject! {|string| string == "" }
  string.select  {|string| string[0].match(/[a-zA-Z]/)}
end

# reflections: I began by trying to find a regex that would match exactly what I want.
# this approach proved time consuming and the right expression ultimately elusive.
# I am not happy with the above code as it is very hard to read.

# solution from CodeWars:

=begin

def get_hashtags(post)
  post.split.grep(/^#+(\w+)$/) { $1 }
end

  
=end