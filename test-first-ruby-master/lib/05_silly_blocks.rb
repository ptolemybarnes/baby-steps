def reverser
input = yield
input = input.split(" ").collect {|word| word.reverse}
input.join(" ")
end

def adder(num=1)
yield + num
end

def repeater(times=1)
times.times {yield}
end