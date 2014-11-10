def add(a,b)
a+b
end

def subtract(a,b)
a-b
end

def sum(arr)
arr == [] ? 0 : arr.inject{|sum,i| sum + i}
end

def multiply(*nums)
nums.inject(1) {|product,i| product*i }
end

def power(a,b)
a**b
end

def factorial(num)
sum = 1
	until num == 0
	sum = sum * num
	num -= 1
	end
sum
end