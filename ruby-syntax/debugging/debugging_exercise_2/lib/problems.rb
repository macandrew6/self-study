# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor (num)
  n = num
  while n > 0
    if (num % n == 0 && is_prime?(n))
      return n
    end
    n -= 1
  end
end

def is_prime? (num)
  return false if num < 2

  (2...num).each do |n|
    return false if num % n == 0
  end

  return true
end

def unique_chars? (string)
  counter = Hash.new(0)

  string.each_char do |letter|
    counter[letter] += 1
    return false if counter[letter] > 1
  end

  true
end

def dupe_indices (array)
  indices_tracker = Hash.new {|h, k| h[k] = []}

  array.each_with_index do |el, i|
    indices_tracker[el] << i
  end

  return indices_tracker.select {|k, v| v.length > 1}
end

def ana_array (arr_1, arr_2)
  return false if arr_1.length != arr_2.length
  count_els(arr_1) == count_els(arr_2)
end

def count_els (array)
  counter = Hash.new(0)
  array.each do |el|
    counter[el] += 1
  end

  return counter
end