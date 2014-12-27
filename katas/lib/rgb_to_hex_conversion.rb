=begin
Complete the method so that passing in RGB decimal values 
will result in a hexadecimal representation being returned. 
The valid decimal values for RGB are 0 - 255. 
Any (r,g,b) argument values that fall out of that range 
should be rounded to the closest valid value.
=end

def rgb(*args)
  args.map {|val| get_hex(val) }.join
end

def get_hex number
  return 'FF' if number > 255
  return '00' if number < 0
  hex = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F']
  hex[number / 16] + hex[number % 16]
end

=begin
popular solution from CodeWars

  def rgb(r, g, b)
    "%.2X%.2X%.2X" % [r,g,b].map{|i| [[i,255].min,0].max}
  end

Uses sprintf. see: http://www.ruby-doc.org/core-2.2.0/Kernel.html#method-i-sprintf
This method uses Ruby's built in hex convertor.
=end