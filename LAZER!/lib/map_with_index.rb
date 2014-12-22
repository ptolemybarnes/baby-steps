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

  def collapse(*args, &proc)
    start = (args[0].is_a? Numeric ) ? args[0] : nil
    return collapse(start, &args[-1].to_proc) unless block_given?
    pile, idx = (start ? start : self[0]), (start ? 0 : 1)
    self.each_with_index {|item, idx| pile = yield(pile, item) if start || idx != 0}
    pile
  end

  def map_with_recursion new_array = [], &block
    return new_array if new_array.length == self
    new_array << yield(self[new_array.length])
    map_with_recursion(new_array, &block)
  end

end