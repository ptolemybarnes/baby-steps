require 'prime'
fig = 600851475143
primeFacts = []
primes = Prime.take 100000
selector = 0
while selector < primes.length
	if (fig / primes[selector]) == (fig.to_f / primes[selector].to_f)
		fig = fig / primes[selector]
		primeFacts.push primes[selector]
	else
		selector = selector + 1
	end
end
puts primeFacts.to_s

