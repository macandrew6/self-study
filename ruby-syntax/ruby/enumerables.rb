class Array
# My Each
# Extend the Array class to include a method named my_each that takes a block, calls 
# the block on every element of the array, and returns the original array. Do not 
# use Enumerable's each method. I want to be able to write:
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end

    self
  end

# My Select
# Now extend the Array class to include my_select that takes a block and returns a 
# new array containing only elements that satisfy the block. Use your my_each method!
  def my_select(&prc)
    new_arr = []
    self.my_each do |el|
      if prc.call(el) == true
        new_arr << el
      end
    end

    return new_arr
  end

# My Reject
# Write my_reject to take a block and return a new array excluding elements that 
# satisfy the block.
  def my_reject(&prc)
    new_arr = []
    self.my_each do |el|
      if prc.call(el) == false
        new_arr << el
      end
    end

    return new_arr
  end

# My Any
# Write my_any? to return true if any elements of the array satisfy the block and 
# my_all? to return true only if all elements satisfy the block.
  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el) == true
    end

    false
  end
end

arr = [1, 2, 3, 4]

p arr.my_any? {|el| el > 2}