def element_count(array)
  counter = Hash.new(0)

  array.each do |el|
    counter[el] += 1
  end

  counter
end

def char_replace!(str, hash)
  str.each_char.with_index do |char, i|
    if hash[char]
      str[i] = hash[char]
    end
  end

  str
end

def product_inject(array)
  array.inject do |acc, curr|
    acc * curr
  end
end