def hipsterfy (word)
  # return the word with the last vowel removed
  vowels = 'aeiou'

  i = word.length - 1
  while i >= 0
    if vowels.include?(word[i])
      word[i] = ''
      break
    end
    i -= 1
  end
  return word
end

def vowel_counts (word)
  vowels = 'aeiou'
  counter = Hash.new(0)

  word.downcase.each_char do |letter|
    if vowels.include?(letter)
      counter[letter] += 1
    end
  end

  return counter
end

def caesar_cipher (message, num)
  alpha = 'abcdefghijklmnopqrstuvwxyz'
  ciphered = ''

  message.each_char do |char|
    if alpha.include?(char)
      old_index = alpha.index(char)
      new_index = (old_index + num) % 26
      ciphered += alpha[new_index]
    else 
      ciphered += char
    end
  end

  ciphered
end