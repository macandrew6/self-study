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

# My Flatten
# my_flatten should return all elements of the array into a new, one-dimensional 
# array. Hint: use recursion!
  def my_flatten
    flat_arr = []
    self.my_each do |el|
      if el.is_a?(Array)
        flat_arr.concat(el.my_flatten)
      else
        flat_arr << el
      end
    end

    flat_arr
  end

# My Zip
# Write my_zip to take any number of arguments. It should return a new array containing 
# self.length elements. Each element of the new array should be an array with a length 
# of the input arguments + 1 and contain the merged elements at that index. If the size 
# of any argument is less than self, nil is returned for that location.
  def my_zip(*args)
    zipped = Array.new(self.length) {Array.new}
    self.each_with_index do |el, i|
      zipped[i] << el
      args.each_with_index do |arr|
        p zipped
        zipped[i] << arr[i]
      end
    end
    zipped
  end

# My Rotate
# Write a method my_rotate that returns a new array containing all the elements of 
# the original array in a rotated order. By default, the array should rotate by one 
# element. If a negative value is given, the array is rotated in the opposite direction.
  def my_rotate(num = 1)
    if num > 0
      num.times {self.rotate_left}
    else
      (num.abs).times {self.rotate_right}
    end
    self
  end

  def rotate_left
    first_el = self.shift!
    self.push(first_el)
  end

  def rotate_right(num)
    last_el = self.pop!
    self.unshift(last_el)
  end

end

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]

# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# # p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
a = [ "a", "b", "c", "d" ]
a.my_rotate         #=> ["b", "c", "d", "a"]
a.my_rotate(2)      #=> ["c", "d", "a", "b"]
a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
a.my_rotate(15)     #=> ["d", "a", "b", "c"]