# PROBLEM 7: What is the 10 001st prime number?

def is_prime?(num)
(2..(Math.sqrt(num).to_i)).each {|div| return false if (num % div == 0)}
true
end

prime_array = [2]
num = 3
until prime_array.length == 10_001
prime_array.push num if is_prime?(num)		
num += 2
end
puts "The 10,001st prime number is #{prime_array[-1]}."