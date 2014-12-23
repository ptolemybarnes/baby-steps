  
  # sorts one string by another. http://www.codewars.com/kata/536c6b8749aa8b3c2600029a/train/ruby

  def a_string_of_sorts string, order_string
    string = string.chars
    order  = order_string.chars
    output = []

    order.each do |order|
      idx = 0
      while string[idx]
        if string[idx] == order
          output.push string.delete_at(idx)
        else
          idx += 1
        end
      end
    end
    (output + string).join
  end

  # Best practice, from Code Wars

def sort_string(str, ordering)
  str.chars.sort_by { |c| ordering.index(c) || ordering.size }.join
end