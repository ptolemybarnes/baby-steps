class Array

  def collapse(*args, &proc)
    start = (args[0].is_a? Numeric ) ? args[0] : nil
    return collapse(start, &args[-1].to_proc) unless block_given?
    pile, idx = (start ? start : self[0]), (start ? 0 : 1)
    self.each_with_index {|item, idx| pile = yield(pile, item) if start || idx != 0}
    pile
  end
  
end