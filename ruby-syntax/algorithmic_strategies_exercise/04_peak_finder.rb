# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.

def peak_finder(arr) 
  # edge cases if el to the left is nil && current el is less than el to the right << push into array
  # edge cases if el to the right is nil && current el is less than el to the left << push into array
  # if el to the left and right < than current el << push into array
  peaks = []

  i = 0
  while i < arr.length
    if i == 0 && arr[i] > arr[i + 1]
      peaks << arr[i]
    elsif i == arr.length - 1 && arr[i] > arr[i - 1]
      peaks << arr[i]
    elsif arr[i - 1] < arr[i] && arr[i] > arr[i + 1]
      peaks << arr[i]
    end
    i += 1
  end

  return peaks
end

p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
p peak_finder([1, 3])               # => [3]
p peak_finder([3, 1])               # => [3]
