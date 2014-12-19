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

  def collapse(start = nil, &block)
    v, i = (start ? start : self[0]), (start ? 0 : 1)
    while self[i]
      v = yield(v, self[i])
      i += 1
    end
    v
  end

  def map_with_recursion new_array = [], &block
    return new_array if new_array.length == self
    new_array << yield(self[new_array.length])
    map_with_recursion(new_array, block)
  end


end