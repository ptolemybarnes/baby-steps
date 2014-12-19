class Array

  def each_special
    i = 0
    new_array = []
    while self[i]
      new_array << yield(self[i])
      i += 1
    end
    new_array
  end

  def each_with_index_special
    i = 0
    new_array = []
    while self[i]
      new_array << yield(self[i], i)
      i += 1
    end
    new_array
  end
  

  def map_with_index
    
  end

  def shoot(start = nil)
    if start
      starting_value = start
      starting_index = 0
    else
      starting_value = self[0]
      starting_index = 1
    end

    while self[starting_index]
      starting_value = yield(starting_value, self[starting_index])
      starting_index += 1
    end
    starting_value
  end
end