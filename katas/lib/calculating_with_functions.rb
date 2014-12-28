# CodeWars Kata: http://www.codewars.com/kata/525f3eda17c7cd9f9e000b39/train/ruby

=begin
This time we want to write calculations using functions and get the results.
Let's have a look at some examples:

seven(times(five)) # must return 35
four(plus(nine)) # must return 13
eight(minus(three)) # must return 5
six(divided_by(two)) # must return 3

Requirements:

There must be a function for each number from 0 ("zero") to 9 ("nine")
There must be a function for each of the following mathematical operations: 
  plus, minus, times, dividedBy (divided_by in Ruby)
Each calculation consist of exactly one operation and two numbers
The most outer function represents the left operand, the most inner function
 represents the right operand
=end

def plus number
  Proc.new do |leftop|
    leftop + number
  end
end

def minus number
  Proc.new do |leftop|
    leftop - number
  end
end

def times number
  Proc.new do |leftop| 
    leftop * number
  end
end

def divided_by number
  Proc.new do |leftop| 
    leftop / number.to_f
  end
end

# Number methods need to return the corresponding integer if they are the right-hand
# operand.
# But should take a block containing the function they should be coordinated with if
# they are the left-hand operand.

def zero num_function = nil
  num_function ? num_function.call(0) : 0
end

def one num_function = nil
  num_function ? num_function.call(1) : 1
end

def two num_function = nil
  num_function ? num_function.call(2) : 2
end

def three num_function = nil
  num_function ? num_function.call(3) : 3
end

def four num_function = nil
  num_function ? num_function.call(4) : 4
end

def five num_function = nil
  num_function ? num_function.call(5) : 5
end

def six num_function = nil
  num_function ? num_function.call(6) : 6
end

def seven num_function = nil
  num_function ? num_function.call(7) : 7
end

def eight num_function = nil
  num_function ? num_function.call(8) : 8
end

def nine num_function = nil
  num_function ? num_function.call(9) : 9
end

=begin # best practice from CodeWars

class Object
  %w[zero one two three four five six seven eight nine].each_with_index do |name, n|
    define_method(name) do |args = nil|
      args ? n.send(*args) : n.to_f
    end
  end

# 94: Creates array of strings to iterate over, with index.
# 95 - 96: defines a method with each string, uses the index to match up the string to the real
# integer it refers to.
# One, for example, will return 1.0 if there are no arguments.
# If there are arguments (:*, 5), for example, it will carry those out.
  
  %w[plus + minus - times * divided_by /].each_slice(2) do |name, symbol|
    define_method(name) do |n|
      [symbol, n]
    end
  end
end

=end











