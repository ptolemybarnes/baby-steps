def is_prime? number
  2.upto(Math::sqrt(number)) do |divisor|
    return false if (number % divisor == 0)
  end
  true
end

def prime number
  (2..number).to_a.select {|number| is_prime?(number) }
end