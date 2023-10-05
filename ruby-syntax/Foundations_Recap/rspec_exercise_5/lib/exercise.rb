def zip(*arrays)
  new_arr = Array.new(arrays[0].length) { Array.new(arrays.length)}
  
  (0...arrays.length).each do |row|
    (0...arrays[row].length).each do |col|
      new_arr[col][row] = arrays[row][col]
    end
  end
  
  new_arr
end

# a1 = ['a', 'b', 'c'] 
# a2 = [1, 2, 3]
# a3 = ['w', 'x', 'y']
# p zip(a1, a2, a3)
# p zip(a1, a2)
# p zip(a3)


def prizz_proc(array, prc_1, prc_2)
  array.select do |el|
    if prc_1.call(el) == true && prc_2.call(el) == false
      el
    elsif prc_1.call(el) == false && prc_2.call(el) == true
      el
    end
  end
end


def zany_zip(*arrs)
  length = arrs.map(&:length).max
  
  (0...length).map do |i|
    arrs.map {|array| array[i]}
  end
end

a1 = ['a', 'b', 'c'] 
a2 = [1]
a3 = ['w', 'x', 'y', 'b', 'c']
# p zany_zip(a1, a2, a3)
# p zany_zip(a1, a2)
# p zany_zip(a3)


def maximum(array, &prc)
  max = 0
  curr = nil

  array.each do |el|
    if prc.call(el) >= max
      max = prc.call(el)
      curr = el
    end
  end

  curr
end

# p maximum(['andy', 'jeremy', 'kristen']) {|el| el.length}
# p maximum([5, 20, 105, 90]) {|el| el + 90}


def my_group_by(array, &prc)
  hash = Hash.new {|h, k| h[k] = Array.new}

  array.each do |el|
    hash[prc.call(el)] << el
  end

  hash
end

test1 = ['mouse', 'dog', 'goat', 'bird', 'cat']
test2 = [1, 2, 9, 30, 11, 38]

# p my_group_by(test1) {|str| str.length}
# p my_group_by(test2) {|n| n % 2}


def max_tie_breaker(array, prc, &bloc)
  max = array.first
  
  array.each do |el|
    result_curr = bloc.call(el)
    result_max = bloc.call(max)
    if result_curr > result_max
      max = el
    elsif result_curr == result_max && prc.call(el) > prc.call(max)
      max = el
    end
  end

  max
end

length = Proc.new { |s| s.length }
o_count = Proc.new { |s| s.count('o') }
arr_1 = ['potato', 'swimming', 'cat']
arr_2 = ['hamster', 'mushroom', 'swimming', 'kangaroo', 'cat']

# p max_tie_breaker(arr_2, length, &o_count)


def silly_syllables(sent)
  new_sent = sent.split(' ').map do |word|
    process_word(word)
  end

  new_sent.join(' ')
end

def process_word(word)
  vowels = 'aeiou'
  vowel_count = word.split('').count {|let| vowels.include?(let)}
  return word if vowel_count < 2

  indicies = first_last_vowel_indicies(word)
  word[indicies.first..indicies.last]
end

def first_last_vowel_indicies(word)
  vowels = 'aeiou'
  indicies = []

  (0...word.length).each do |i|
    indicies << i if vowels.include?(word[i])
  end

  [indicies.first, indicies.last]
end

p process_word('properly')
p first_last_vowel_indicies('properly')
p silly_syllables('properly and precisely written code')