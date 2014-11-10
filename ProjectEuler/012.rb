# PROBLEM 12: What is the value of the first triangle number to have over 500 divisors?

class Integer
  def factors()
    1.upto(Math.sqrt(self)).select {|i| (self % i).zero?}.inject([]) do |f, i| 
      f << i
      f << self/i unless i == self/i
      f
    end.sort
  end
end

def tri_num_divisors(target)
	tri_count = 1
	tri_num = 0
	div_count = 0

	loop do
	tri_num = tri_count + tri_num 
	break if tri_num.factors.length > target
	tri_count += 1
	end

	puts "The first triangle number with over #{target} divisors is #{tri_num}, which has #{tri_num.factors.length} divisors."
end

tri_num_divisors(500)