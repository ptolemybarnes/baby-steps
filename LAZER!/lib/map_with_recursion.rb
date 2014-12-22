class Array

  def map_with_recursion new_array = [], &block
    return new_array if new_array.length == self
    new_array << yield(self[new_array.length])
    map_with_recursion(new_array, &block)
  end

end