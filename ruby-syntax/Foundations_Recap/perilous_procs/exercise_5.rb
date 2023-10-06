# some?
# Write a method some? that accepts an array and a block as arguments. The method 
# should return a boolean indicating whether or not at least one of the elements of 
# the array returns true when given to the block. Solve this using Array#each.

def some?(array, &prc)
  array.each do |el|
    if prc.call(el)
      return true
    end
  end
  return false
end

# Examples

# p some?([3, 1, 11, 5]) { |n| n.even? }                                # false
# p some?([3, 4, 11, 5]) { |n| n.even? }                                # true
# p some?([8, 2]) { |n| n.even? }                                       # true
# p some?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' } # false
# p some?(['squash', 'corn', 'kale', 'potato']) { |str| str[0] == 'p' } # true
# p some?(['parsnip', 'lettuce', 'pea']) { |str| str[0] == 'p' }        # true


# exactly?
# Write a method exactly? that accepts an array, a number (n), and a block as arguments. 
# The method should return a boolean indicating whether or not there are exactly n 
# elements that return true when given to the block. Solve this using Array#each.

def exactly?(array, n, &prc)
  count = n

  array.each do |el|
    count -= 1 if prc.call(el) == true
  end

  return true if count == 0
  false
end

# Examples

# p exactly?(['A', 'b', 'C'], 2) { |el| el == el.upcase }         # true
# p exactly?(['A', 'B', 'C'], 2) { |el| el == el.upcase }         # false
# p exactly?(['A', 'B', 'C'], 3) { |el| el == el.upcase }         # true
# p exactly?(['cat', 'DOG', 'bird'], 1) { |el| el == el.upcase }  # true
# p exactly?(['cat', 'DOG', 'bird'], 0) { |el| el == el.upcase }  # false
# p exactly?(['cat', 'dog', 'bird'], 0) { |el| el == el.upcase }  # true
# p exactly?([4, 5], 3) { |n| n > 0 }                             # false
# p exactly?([4, 5, 2], 3) { |n| n > 0 }                          # true
# p exactly?([42, -9, 7, -3, -6], 2) { |n| n > 0 }                # true


# filter_out
# Write a method filter_out that accepts an array and a block as arguments. The 
# method should return a new array where elements of the original array are removed 
# if they return true when given to the block. Solve this using Array#each.

def filter_out(array, &prc)
  new_arr = []

  array.each do |el|
    new_arr << el if !prc.call(el)
  end

  new_arr
end

# Examples

# p filter_out([10, 6, 3, 2, 5 ]) { |x| x.odd? }      # [10, 6, 2]
# p filter_out([1, 7, 3, 5 ]) { |x| x.odd? }          # []
# p filter_out([10, 6, 3, 2, 5 ]) { |x| x.even? }     # [3, 5]
# p filter_out([1, 7, 3, 5 ]) { |x| x.even? }         # [1, 7, 3, 5]


# at_least?
# Write a method at_least? that accepts an array, a number (n), and a block as an 
# arguments. The method should return a boolean indicating whether or not at least 
# n elements of the array return true when given to the block. Solve this using Array#each.

def at_least?(array, n, &prc)
  count = 0

  array.each do |el|
    count += 1 if prc.call(el) == true
  end

  return true if count >= n
  false
end

# # Examples

# p at_least?(['sad', 'quick', 'timid', 'final'], 2) { |s| s.end_with?('ly') }
# # false
# p at_least?(['sad', 'quickly', 'timid', 'final'], 2) { |s| s.end_with?('ly') }
# # false
# p at_least?(['sad', 'quickly', 'timidly', 'final'], 2) { |s| s.end_with?('ly') }
# # true
# p at_least?(['sad', 'quickly', 'timidly', 'finally'], 2) { |s| s.end_with?('ly') }
# # true
# p at_least?(['sad', 'quickly', 'timid', 'final'], 1) { |s| s.end_with?('ly') }
# # true
# p at_least?(['sad', 'quick', 'timid', 'final'], 1) { |s| s.end_with?('ly') }
# # false
# p at_least?([false, false, false], 3) { |bool| bool }
# # false
# p at_least?([false, true, true], 3) { |bool| bool }
# # false
# p at_least?([true, true, true], 3) { |bool| bool }
# # true
# p at_least?([true, true, true, true], 3) { |bool| bool }
# # true


# every?
# Write a method every? that accepts an array and a block as arguments. The method 
# should return a boolean indicating whether or not all elements of the array return 
# true when given to the block. Solve this using Array#each.

def every?(array, &prc)
  count = array.length
  array.each do |el|
    return false if !prc.call(el)
  end
  true
end

# Examples

# p every?([3, 1, 11, 5]) { |n| n.even? }                                 # false
# p every?([2, 4, 4, 8]) { |n| n.even? }                                  # true
# p every?([8, 2]) { |n| n.even? }                                        # true
# p every?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' }  # false
# p every?(['squash', 'pea', 'kale', 'potato']) { |str| str[0] == 'p' }   # false
# p every?(['parsnip', 'potato', 'pea']) { |str| str[0] == 'p' }          # true


# at_most?
# Write a method at_most? that accepts an array, a number (n), and a block as arguments. 
# The method should return a boolean indicating whether no more than n elements of 
# the array return true when given to the block. Solve this using Array#each.

def at_most?(array, n, &prc)
  count = 0

  array.each do |el|
    count += 1 if prc.call(el) == true
  end

  count <= n
end

# Examples

# p at_most?([-4, 100, -3], 1) { |el| el > 0 }                         # true
# p at_most?([-4, -100, -3], 1) { |el| el > 0 }                        # true
# p at_most?([4, 100, -3], 1) { |el| el > 0 }                          # false
# p at_most?([4, 100, 3], 1) { |el| el > 0 }                           # false
# p at_most?(['r', 'q', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }    # true
# p at_most?(['r', 'i', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }    # true
# p at_most?(['r', 'i', 'e', 'o'], 2) { |el| 'aeiou'.include?(el) }    # false


# first_index
# Write a method first_index that accepts an array and a block as arguments. The 
# method should return the index of the first element of the array that returns true 
# when giben to the block. If no element of returns true, then the method should 
#   return nil. Solve this using Array#each.

def first_index(array, &prc)
  array.each_with_index do |el, i|
    return i if prc.call(el) == true
  end

  nil
end

# Examples

# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.length > 3 }           # 2
# p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 3 } # 0
# p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 6 } # nil
# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 'b' }            # 0
# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.include?('a') }        # 1
# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 't' }            # nil


# xnor_select
# Write a method xnor_select that accepts an array and two procs as arguments. The 
# method should return a new array containing elements of the original array that 
# either return true for both procs or return false for both procs.

def xnor_select(array, prc_1, prc_2)
  new_arr = []
  array.each do |el|
    if prc_1.call(el) && prc_2.call(el) || !prc_1.call(el) && !prc_2.call(el)
      new_arr << el
    end
  end
  new_arr
end

# Examples

# is_even = Proc.new { |n| n % 2 == 0 }
# is_odd = Proc.new { |n| n % 2 != 0 }
# is_positive = Proc.new { |n| n > 0 }
# p xnor_select([8, 3, -4, -5], is_even, is_positive)         # [8, -5]
# p xnor_select([-7, -13, 12, 5, -10], is_even, is_positive)  # [-7, -13, 12]
# p xnor_select([-7, -13, 12, 5, -10], is_odd, is_positive)   # [5, -10]


# filter_out!
# Rewrite your previous filter_out method to mutate the input array instead of 
# returning a new array. That is, write a method filter_out! that accepts an array 
# and a block as args. The method should remove elements of the input array that 
# return true when given to the block. Solve this without using Array.reject!.

def filter_out!(array, &prc)
  dup = array.dup

  dup.each_with_index do |el, i|
    if prc.call(el) == true
      array.delete(el)
    end
  end

  array
end

# Examples

# arr_1 = [10, 6, 3, 2, 5 ]
# filter_out!(arr_1) { |x| x.odd? }
# p arr_1     # [10, 6, 2]

# arr_2 = [1, 7, 3, 5 ]
# filter_out!(arr_2) { |x| x.odd? }
# p arr_2     # []

# arr_3 = [10, 6, 3, 2, 5 ]
# filter_out!(arr_3) { |x| x.even? }
# p arr_3     # [3, 5]

# arr_4 = [1, 7, 3, 5 ]
# filter_out!([1, 7, 3, 5 ]) { |x| x.even? }
# p arr_4 # [1, 7, 3, 5]


# multi_map
# Write a method multi_map that accepts an array, an optional number (n), and a 
# block as arguments. The method should return a new array where each element of the 
# original array is repeatedly run through the block n times. If the number argument 
# is not passed in, then the the elements should be run through the block once.

def multi_map(array, n = 1, &prc)
  new_arr = []

  array.each do |el|
    new_el = el
    n.times do 
      new_el = prc.call(new_el)
    end
    new_arr << new_el
  end

  new_arr
end

# Examples

# p multi_map(['pretty', 'cool', 'huh?']) { |s| s + '!'}      # ["pretty!", "cool!", "huh?!"]
# p multi_map(['pretty', 'cool', 'huh?'], 1) { |s| s + '!'}   # ["pretty!", "cool!", "huh?!"]
# p multi_map(['pretty', 'cool', 'huh?'], 3) { |s| s + '!'}   # ["pretty!!!", "cool!!!", "huh?!!!"]
# p multi_map([4, 3, 2, 7], 1) { |num| num * 10 }             # [40, 30, 20, 70]
# p multi_map([4, 3, 2, 7], 2) { |num| num * 10 }             # [400, 300, 200, 700]
# p multi_map([4, 3, 2, 7], 4) { |num| num * 10 }             # [40000, 30000, 20000, 70000]


# proctition
# Write a method proctition that accepts an array and a block as arguments. The 
# method should return a new array where the elements that return true when given 
# to the block come before all of the elements that return false when given to the 
# block. This means that the new array has two partitions; the order among elements 
# in the same partition should be the same as their relative order in the input array.

def proctition(array, &prc)
  left_arr = []
  right_arr = []

  array.each do |el|
    if prc.call(el) == true
      left_arr << el
    else
      right_arr << el
    end
  end
  
  left_arr.concat(right_arr)
end

# # Examples

# p proctition([4, -5, 7, -10, -2, 1, 3]) { |el| el > 0 }
# # [4, 7, 1, 3, -5, -10, -2]

# p proctition([7, 8, 3, 6, 10]) { |el| el.even? }
# # [8, 6, 10, 7, 3]

# p proctition(['duck', 'cab','boot', 'dog', 'bug', 'boat']) { |s| s[0] == 'b' }
# # ["boot", "bug", "boat", "cat", "dog"]


# selected_map!
# Write a method selected_map! that accepts an array and two procs as arguments. The 
# method should replace the elements that return true when passed into the first proc 
# with their return values when they are passed into the second proc. This method 
# should mutate the input array and return nil.

def selected_map! (array, prc_1, prc_2)
  array.each_with_index do |el, i|
    if prc_1.call(el) == true
      array[i] = prc_2.call(el)
    end
  end

  nil
end

# Examples

# is_even = Proc.new { |n| n.even? }
# is_positive = Proc.new { |n| n > 0 }
# square = Proc.new { |n| n * n }
# flip_sign = Proc.new { |n| -n }

# arr_1 = [8, 5, 10, 4]
# p selected_map!(arr_1, is_even, square)     # nil
# p arr_1                                     # [64, 5, 100, 16]

# arr_2 = [-10, 4, 7, 6, -2, -9]
# p selected_map!(arr_2, is_even, flip_sign)  # nil
# p arr_2                                     # [10, -4, 7, -6, 2, -9]

# arr_3 = [-10, 4, 7, 6, -2, -9]
# p selected_map!(arr_3, is_positive, square) # nil
# p arr_3                                     # [-10, 16, 49, 36, -2, -9]


# chain_map
# Write a method that accepts any value and an array of procs as an argument. The 
# method should return the final result of feeding the value through all of the procs. 
# For example, if the array contains three procs, then:

# the value is given to the first proc
# the result of the first proc is given to the second proc
# the result of the second proc is given to the third proc
# the result of third proc is the final result
# Examples

def chain_map(n, procs)
  value = n
  procs.each do |prc|
    value = prc.call(value)
  end
  value
end

# add_5 = Proc.new { |n| n + 5 }
# half = Proc.new { |n| n / 2.0 }
# square = Proc.new { |n| n * n }

# p chain_map(25, [add_5, half])          # 15.0
# p chain_map(25, [half, add_5])          # 17.5
# p chain_map(25, [add_5, half, square])  # 225
# p chain_map(4, [square, half])          # 8
# p chain_map(4, [half, square])          # 4


# proc_suffix
# Write a method proc_suffix that accepts a sentence and a hash as arguments. The 
# hash contains procs as keys and suffix strings as values. The method should return 
# a new sentence where each word of the original sentence is appended with a suffix 
# if the original word returns true when given to the corresponding proc key. If an 
#   original word returns true for multiple procs, then the suffixes should be appended 
# in the order that they appear in the input hash.

def proc_suffix(sent, hash)
  words = sent.split(' ')
  new_words = []
  words.each do |word|
    new_word = word
    hash.each do |prc, val|
      new_word += val if prc.call(word) == true
    end
    new_words << new_word
  end

  new_words.join(' ')
end

# Examples

# contains_a = Proc.new { |w| w.include?('a') }
# three_letters = Proc.new { |w| w.length == 3 }
# four_letters = Proc.new { |w| w.length == 4 }

# p proc_suffix('dog cat',
#     contains_a => 'ly',
#     three_letters => 'o'
# )   # "dogo catlyo"

# p proc_suffix('dog cat',
#     three_letters => 'o',
#     contains_a => 'ly'
# )   # "dogo catoly"

# p proc_suffix('wrong glad cat',
#     contains_a => 'ly',
#     three_letters => 'o',
#     four_letters => 'ing'
# )   # "wrong gladlying catlyo"

# p proc_suffix('food glad rant dog cat',
#     four_letters => 'ing',
#     contains_a => 'ly',
#     three_letters => 'o'
# )   # "fooding gladingly rantingly dogo catlyo"


# proctition_platinum
# Write a method proctition_platinum that accepts an array and any number of additional 
# procs as arguments. The method should return a hash where the keys correspond to 
# the number of procs passed in.

# For example, if three procs are passed in, then the hash should have the keys 1, 
# 2, and 3.
# The values associated with each key should be an array containing the elements of 
# the input array that return true when passed into the corresponding proc.

# For example, this means that the array that corresponds to the key 2 should contain 
# the elements that return true when passed into the second proc.
# If an element returns true for multiple procs, then it should only be placed into 
# the array that corresponds to the proc that appears first in the arguments.

def proctition_platinum(array, *prcs)
  hash = Hash.new # {1: ['when!', 'WHERE!'], 2: ['what]}
  prcs.each_index {|i| hash[i + 1] = []}

  array.each do |el| #what
    prcs.each_with_index do |prc, i|
      if prc.call(el) #what
        hash[i + 1] << el
        break
      end
    end
  end

  hash
end

is_yelled = Proc.new { |s| s[-1] == '!' }
is_upcase = Proc.new { |s| s.upcase == s }
contains_a = Proc.new { |s| s.downcase.include?('a') }
begins_w = Proc.new { |s| s.downcase[0] == 'w' }

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, contains_a)
# {1=>["when!", "WHERE!"], 2=>["what"]}

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, is_upcase, contains_a)
# {1=>["when!", "WHERE!"], 2=>["WHO", "WHY"], 3=>["what"]}

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_upcase, is_yelled, contains_a)
# {1=>["WHO", "WHERE!", "WHY"], 2=>["when!"], 3=>["what"]}

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], begins_w, is_upcase, is_yelled, contains_a)
# {1=>["WHO", "what", "when!", "WHERE!", "WHY"], 2=>[], 3=>[], 4=>[]}