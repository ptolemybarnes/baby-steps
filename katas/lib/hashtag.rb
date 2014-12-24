# CodeWars Kata: http://www.codewars.com/kata/52ae2db783f47875d0000064/train/ruby
# Write a method that captures words prefixed by hashtags.

def get_hashtags(string)
  string = string.prepend(" ")
  string = string.split(/ #+/)
  string = string.select {|string| string[0] != " " }
  string = string.reject {|string| string.include?('#')}
  string = string.map {|string| string.include?(' ') ? string[0..string.index(" ")] : string}
  string = string.map {|string| string.rstrip }
  string = string.reject {|string| string == "" }
  string = string.select {|string| string[0].match(/[a-zA-Z]/)}
end