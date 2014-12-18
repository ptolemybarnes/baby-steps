class Integer

  def tickto target
    raise 'Error: Integer#tickto should take Fixnum as an argument' if target.class != Fixnum
    case self <=> target
    when 1
      return self - 1
    when -1
      return self + 1
    when 0 
      return self
    end
  end

end

class Array

  def tickto target  
    raise 'Error: Array#tickto should take an array as argument' if target.class != Array
    self.each_with_index.map do |number, index|
      number.tickto target[index]
    end
  end

end