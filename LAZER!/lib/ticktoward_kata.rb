=begin
Define a method, "tick_toward", that generates medial values between two coordinates.

Details:
1) Takes a starting coordinate, start_xy, and a target coordinate, target_xy.
2) Returns an array of coordinates from start_xy to target_xy.
  
- Examples:
  - tick_toward([5,5],[5,7]) *=> [[5,5],[5,6],[5,7]]*
  - tick_toward([3,2],[4,5]) => [[3,2],[4,3],[4,4],[4,5]]
  - tick_toward([5,1],[5,-2]) => [[5,1],[5,0],[5,-1],[5,-2]]
  
 etc.
 
NOTE: x should "tick towards" target_x indepedently of y, same with y.
=end

def ticktoward(start, target)
  output = [start]
  until output.last == target
    output << [output.last[0].ticktoward(target[0]), output.last[1].ticktoward(target[1])]
  end
  output
end

class Integer

  def ticktoward target
    case self <=> target
    when 0
      return self
    when 1
      return self - 1
    when -1
      return self + 1
    end
  end

end
