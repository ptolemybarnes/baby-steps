=begin

Implement a change function that performs at O(n) (we will test for this).
It should take an integer representing cents, and returns:
 - the optimal change using the least number of coins.
 - a hash containing a key for each coin of US currency (specifically 25¢ 10¢ 5¢ and 1¢ coins -- don't use 50¢ or 100¢ coins). 
   The value of each coin should represent the count of each coin in the change.
The function should return a hash with all coin count values set to 0 if the cents parameter is less than or equal to 0.

e.g change(31) # => { 25 => 1, 10 => 0, 5 => 1, 1 => 1 }
 
=end

def changemachine(cents)
  change = { 25 => 0, 10 => 0, 5 => 0, 1 => 0 }
  return change if cents <= 0

  change.each do |coin, num|
    change[coin] += (cents / coin)
    cents = (cents % coin )
  end
end