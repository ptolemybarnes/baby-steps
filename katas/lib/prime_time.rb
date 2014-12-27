def isnt_prime? number
  (2..Math::sqrt(number)).any? {|div| number % div == 0 }
end

def prime number
  (2..number).reject {|number| isnt_prime?(number) }
end

# refactor using .any? method.