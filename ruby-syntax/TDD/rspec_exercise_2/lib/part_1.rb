def partition (array, num)
  less_arr = array.select {|n| n < num}
  greater_arr = array.select {|n| n >= num}

  return [less_arr, greater_arr]
end

def merge (hash_1, hash_2)
  new_hash = {}
  
  hash_1.each do |k, v|
    new_hash[k] = v
  end
  
  hash_2.each do |k, v|
    new_hash[k] = v
  end

  return new_hash
end

def censor (sentence, curse_words_arr)
  sent_arr = sentence.split(' ')

  new_arr = sent_arr.map do |word|
    if curse_words_arr.include?(word.downcase)
      replace_vowels(word)
    else
      word
    end
  end

  return new_arr.join(' ')
end

def replace_vowels (word)
  vowels = 'aeiou'
  censored_word = ''
  word.each_char do |letter|
    if (vowels.include?(letter.downcase))
      censored_word += '*'
    else
      censored_word += letter
    end
  end
    
  return censored_word
end

def power_of_two? (num)
  product = 1

  while product < num
    product *= 2
  end

  product == num
end