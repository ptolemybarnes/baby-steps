# PROBLEM 10: Summation of primes. Find the sum of all the primes below 2 million.

start_time = Time.now

def is_prime?(num)
(2..(Math.sqrt(num).to_i)).each {|div| return false if (num % div == 0)}
true
end

prime_array = [2]
num = 3
until prime_array.last > 2_000_000
prime_array.push num if is_prime?(num)		
num += 2
end
prime_array.pop
puts "The sum of all primes below two million is #{prime_array.inject(:+)}. This calculation took #{(Time.now - start_time).to_i} seconds to perform."