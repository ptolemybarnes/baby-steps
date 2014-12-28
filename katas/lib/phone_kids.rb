# Write a method that can get all the descendants of a class.

class Mother
  
  def self.descendants
    ObjectSpace.each_object(Class).select {|klass| klass < self }
  end
  
  def self.phone_kids
    descendants = []
    self.descendants.each {|child| descendants << child.new.class }
    descendants.join(", ")
  end
end

class Daughter < Mother ;end
class Son < Mother ;end
class GrandChild < Son ;end

