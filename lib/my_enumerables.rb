module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each()
    self.each { |value| yield value } 
  end

  def my_each_with_index()
    if block_given?
      for i in 0..self.size-1 do
        yield self[i], i
      end
    else
      self
    end
  end

end