class Friend
  def greeting(name=nil)
  	if name
  		output = "Hello, #{name}!"
  	else
  		output = "Hello!"
  	end
  	output
  end
end
