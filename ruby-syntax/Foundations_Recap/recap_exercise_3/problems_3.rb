# no_dupes?
# Write a method no_dupes?(arr) that accepts an array as an arg and returns an new 
# array containing the elements that were not repeated in the array.

def no_dupes?(array)
  counter = Hash.new(0)

  array.each do |el|
    counter[el] += 1
  end

  singles = counter.select {|k, v| v == 1}
  singles.keys
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []


# no_consecutive_repeats?
# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. The 
# method should return true if an element never appears consecutively in the array; 
# it should return false otherwise.

def no_consecutive_repeats?(array)
  (0...array.length - 1).none? {|i| array[i] == array[i + 1]}
end

# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true


# char_indices
# Write a method char_indices(str) that takes in a string as an arg. The method 
# should return a hash containing characters as keys. The value associated with each 
# key should be an array containing the indices where that character is found.

def char_indices(str)
  hash = Hash.new {|h, k| h[k] = Array.new}

  str.each_char.with_index do |char, i|
    hash[char] << i
  end

  hash
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
# p char_indices('claritsa')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


# longest_streak
# Write a method longest_streak(str) that accepts a string as an arg. The method 
# should return the longest streak of consecutive characters in the string. If there 
# are any ties, return the streak that occurs later in the string.

def longest_streak(str)
  curr = '' 
  longest = '' 

  (0...str.length).each do |i|
    if str[i] == str[i - 1] || i == 0
      curr += str[i]
    else 
      curr = str[i] # resets curr
    end

    if curr.length >= longest.length
      longest = curr
    end
  end

  longest
end

p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'
