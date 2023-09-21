def palindrome? (string)
  reversed = ''

  i = string.length - 1
  while i >=0
    reversed += string[i]
    i -= 1
  end

  reversed == string
end

def substrings (string)
  sub_str_arr = []

  string.each_char.with_index do |char1, i1|
    string.each_char.with_index do |char2, i2|
      if i2 >= i1
        sub_str_arr << string[i1..i2]
      end
    end
  end

  return sub_str_arr
end

def palindrome_substrings (string)
  sub_str_arr = substrings(string)

  return sub_str_arr.select {|sub_str| palindrome?(sub_str) && sub_str.length > 1}
end