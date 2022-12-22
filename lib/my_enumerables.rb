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
      for i in 0..(self.size-1) do
        yield self[i], i
      end
    else
      self
    end
  end

  def my_select(&block)
    arr = []
    my_each { |value| arr.push(value) if block.call(value)}
    return arr
  end

  def my_all?(&block)
    condition = true
    my_each { |value| condition = false if !block.call(value)}
    return condition
  end

  def my_any?(&block)
    condition = false
    my_each { |value| condition = true if block.call(value)}
    return condition
  end

  def my_none?(&block)
    condition = true
    my_each { |value| condition = false if block.call(value)}
    return condition
  end

  def my_count(&block)
    if block_given?
      counter = 0
      my_each { |value| counter += 1 if block.call(value) }
      return counter
    else
      length
    end
  end

  def my_map(&block)
    arr = []
    my_each { |value| arr.push(block.call(value)) }
    return arr
  end

  def my_inject(acc, &block)
    arr = self.to_a
    for i in 0..(arr.size-1) do
      acc = block.call(acc, arr[i])
    end 
    return acc
  end
end