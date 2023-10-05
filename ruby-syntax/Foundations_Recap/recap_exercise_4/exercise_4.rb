# strange_sums
# Write a method strange_sums that accepts an array of numbers as an argument. The 
# method should return a count of the number of distinct pairs of elements that have 
# a sum of zero. You may assume that the input array contains unique elements.

def strange_sums(array)
  count = 0

  (0...array.length).each do |start_i|
    (start_i + 1...array.length).each do |end_i|
      count += 1 if array[start_i] + array[end_i] == 0
    end
  end

  count
end

# p strange_sums([2, -3, 3, 4, -2, 0])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0


# pair_product
# Write a method pair_product that accepts an array of numbers and a product as 
# arguments. The method should return a boolean indicating whether or not a pair of 
# distinct elements in the array result in the product when multiplied together. 
# You may assume that the input array contains unique elements.

def pair_product(array, prod)
  (0...array.length).each do |start_i|
    (start_i + 1...array.length).each do |end_i|
      return true if array[start_i] * array[end_i] == prod
    end
  end

  false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false


# rampant_repeats
# Write a method rampant_repeats that accepts a string and a hash as arguments. The 
# method should return a new string where characters of the original string are 
# repeated the number of times specified by the hash. If a character does not exist 
# as a key of the hash, then it should remain unchanged.

def rampant_repeats(str, hash)
  new_str = ''
  
  str.each_char do |char|
    if hash.has_key?(char)
      new_str += char * hash[char]
    else
      new_str += char
    end
  end

  new_str
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'


# perfect_square?
# Write a method perfect_square? that accepts a number as an argument. The method 
# should return a boolean indicating whether or not the argument is a perfect square. 
# A perfect square is a number that is the product of some number multiplied by itself. 
# For example, since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares; 
# 35 is not a perfect square.

def perfect_square?(num)
  (1..num).any? {|n| n * n == num}
end

# p perfect_square?(1)     # true
# p perfect_square?(4)     # true
# p perfect_square?(64)    # true
# p perfect_square?(100)   # true
# p perfect_square?(169)   # true
# p perfect_square?(2)     # false
# p perfect_square?(40)    # false
# p perfect_square?(32)    # false
# p perfect_square?(50)    # false


# anti_prime?
# Write a method anti_prime? that accepts a number as an argument. The method should 
# return true if the given number has more divisors than all positive numbers less 
# than the given number. For example, 24 is an anti-prime because it has more divisors 
# than any positive number less than 24. Math Fact: Numbers that meet this criteria 
# are also known as highly composite numbers.

def anti_prime?(num)
  max_divisors = count_divisors(num)
  (0...num).all? {|n| count_divisors(n) < max_divisors}
end

def count_divisors(num)
  (1..num).count {|n| num % n == 0}
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false


# matrix_addition
# Let a 2-dimensional array be known as a "matrix". Write a method matrix_addition 
# that accepts two matrices as arguments. The two matrices are guaranteed to have 
# the same "height" and "width". The method should return a new matrix representing 
# the sum of the two arguments. To add matrices, we simply add the values at the same 
# positions:

def matrix_addition(mat_1, mat_2)
  (0...mat_1.length).map do |row|
    (0...mat_1[row].length).map do |col|
      mat_1[row][col] + mat_2[row][col]
    end
  end
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]


# mutual_factors
# Write a method mutual_factors that accepts any amount of numbers as arguments. The 
# method should return an array containing all of the common divisors shared among 
# the arguments. For example, the common divisors of 50 and 30 are 1, 2, 5, 10. You 
# can assume that all of the arguments are positive integers.

def mutual_factors(*nums)
  divisors = nums.map {|num| factors(num)}
  # divisors.inject(:&)
  longest = divisors.inject do |acc, cur|
    if cur.length > acc.length
      cur
    else
      acc
    end
  end

  res = []
  longest.each do |n|
    if divisors.all? {|div| div.include?(n)}
      res << n
    end
  end

  res
end

def factors(num)
  (1..num).select {|n| num % n == 0}
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]


# tribonacci_number
# The tribonacci sequence is similar to that of Fibonacci. The first three numbers 
# of the tribonacci sequence are 1, 1, and 2. To generate the next number of the 
# sequence, we take the sum of the previous three numbers. The first six numbers of 
# tribonacci sequence are:

# 1, 1, 2, 4, 7, 13, ... and so on
# Write a method tribonacci_number that accepts a number argument, n, and returns 
# the n-th number of the tribonacci sequence.

def tribonacci_number(n)
  return 1 if n == 1
  return 1 if n == 2
  return 2 if n == 3
  
  # trib_seq = [1, 1, 2]
  # while trib_seq.length < n
  #   trib_seq << (trib_seq[-3] + trib_seq[-2] + trib_seq[-1])
  # end
  # trib_seq.last
  tribonacci_number(n - 3) + tribonacci_number(n - 2) + tribonacci_number(n - 1)
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2 
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274


# matrix_addition_reloaded
# Write a method matrix_addition_reloaded that accepts any number of matrices as 
# arguments. The method should return a new matrix representing the sum of the arguments. 
# Matrix addition can only be performed on matrices of similar dimensions, so if all 
# of the given matrices do not have the same "height" and "width", then return nil.

def matrix_addition_reloaded(*matricies)
  matrix = matricies.first
  height = matrix.length
  width = matrix[0].length
  
  new_matrix = Array.new(height) {[0] * width}
  matricies.inject(new_matrix) do |acc, curr| 
    return nil if curr.length != height || curr[0].length != width
    matrix_addition(acc, curr)
  end
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]
matrix_f = [[2 , 3], [7, 5], [4,  6]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_f)    # nil


# squarocol?
# Write a method squarocol? that accepts a 2-dimensional array as an argument. The 
# method should return a boolean indicating whether or not any row or column is 
# completely filled with the same element. You may assume that the 2-dimensional 
# array has "square" dimensions, meaning it's height is the same as it's width.

def squarocol?(square)
  return true if square.any? {|row| row.uniq.length == 1}
  return true if square.transpose.any? {|col| col.uniq.length == 1}
  false
end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false


# squaragonal?
# Write a method squaragonal? that accepts 2-dimensional array as an argument. The 
# method should return a boolean indicating whether or not the array contains all of 
# the same element across either of its diagonals. You may assume that the 2-dimensional 
# array has "square" dimensions, meaning it's height is the same as it's width.

def squaragonal?(array)
  # Check the main diagonal (from top-left to bottom-right)
  main_diagonal_element = array[0][0]
  return true if (0...array.length).all? do |i| 
    array[i][i] == main_diagonal_element
  end

  # Check the secondary diagonal (from bottom-left to top-right)
  secondary_diagonal_element = array[0][-1] #[2][0] => [1][1] => [0][2]
  return true if (0...array.length).all? do |i|
    array[array.length - 1 - i][0 + i] == secondary_diagonal_element
  end

  # If both diagonals don't have the same element, return false
  return false
end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false


# pascals_triangle
# Pascal's triangle is a 2-dimensional array with the shape of a pyramid. The top 
# of the pyramid is the number 1. To generate further levels of the pyramid, every 
# element is the sum of the element above and to the left with the element above 
# and to the right. Nonexisting elements are treated as 0 when calculating the sum. 
# For example, here are the first 5 levels of Pascal's triangle:

#       1
#      1 1
#     1 2 1
#    1 3 3 1
#   1 4 6 4 1
# Write a method pascals_triangle that accepts a positive number, n, as an argument 
# and returns a 2-dimensional array representing the first n levels of pascal's triangle.
def adjacent_sum(arr)
  sums = []
  (0...arr.length - 1).each do |i|
    sums << arr[i] + arr[i + 1]
  end
  sums
end

def pascals_triangle(n)
  pyramid = [[1],[1, 1]]

  while pyramid.length < n
    last = pyramid.last
    sub = []
    sub << 1
    sub += adjacent_sum(last)
    sub << 1
    pyramid << sub
  end

  pyramid
end

# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(70)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]


# mersenne_prime
# A "Mersenne prime" is a prime number that is one less than a power of 2. This means 
# that it is a prime number with the form 2^x - 1, where x is some exponent. For example:

# 3 is a Mersenne prime because it is prime and 3 = 2^2 - 1
# 7 is a Mersenne prime because it is prime and 7 = 2^3 - 1
# 11 is not a Mersenne prime because although it is prime, it does not have the form 2^x - 1
# The first three Mersenne primes are 3, 7, and 31. Write a method mersenne_prime that 
# accepts a number, n, as an argument and returns the n-th Mersenne prime.

def mersenne_prime(n)
  count = 0
  x = 0
  while count < n
    x += 1
    candidate = (2 ** x) - 1
    count += 1 if is_prime?(candidate)
  end
  candidate
end

def is_prime?(n)
  return false if n < 2
  (2...n).none? {|i| n % i == 0}
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071