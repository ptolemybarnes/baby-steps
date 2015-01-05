# class Array

#   def collapse_legible(*args, &proc)
#     symbol      = args.delete {|arg| arg.is_a? Symbol }
#     start_value = args.sample || nil

#     unless block_given?
#       return self.collapse_legible(start_value, &symbol.to_proc) 
#     end

#     pile = args[:start_value] || self.first
#     idx  = args[:start_value] ? 0 : 1

#     while self[idx]
#       pile = yield(pile, self[idx])
#       idx += 1
#     end

#     pile


#   end

# end