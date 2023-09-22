def select_even_nums (array)
  return array.select(&:even?)
end

# array of dog hashes = [{"name"=>"Fido", "age"=> 3}, {"name"=>"Rex", "age"=>5}]
def reject_puppies (array)
  return array.reject {|dog| dog["age"] <= 2}
end

def count_positive_subarrays (array)
  array.count {|sub_arr| sub_arr.sum > 0}
end

def aba_translate (string)
  vowels = 'aeiou'
  translated = ''

  string.each_char do |letter|
    if (vowels.include?(letter))
      translated += letter + 'b' + letter
    else
      translated += letter
    end
  end

  return translated
end

def aba_array (array)
  array.map {|word| aba_translate(word)}
end