=begin
For this kata you will be extending the Hash class to support a new method called 
'flattened_keys'. The purpose of this method is to return a new hash that has any 
nested values flattened so that there is only the single root hash structure. 
The keys from the nested hash will be merged into the parent, separated by underscores.
=end

class Hash

  def flattened_keys
    output = {}
      self.each do |par_key, par_val|
        if par_val.is_a? Hash
          par_val.each do |child_key, child_val|
            key = "#{par_key.to_s}_#{child_key.to_s}"
            key = key.to_sym unless [par_key, child_key].any? {|key| key.is_a? String}
            output[key] = child_val
          end
        else 
          output[par_key] = par_val
        end

      end
    if output.values.any? {|val| val.is_a? Hash }
      output = output.flattened_keys
    else
      output
    end
  end

end