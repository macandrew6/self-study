# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  counter = 0 
  compression = ''
  i = 0
  while i < str.length
    counter += 1
    if str[i] != str[i + 1] && counter > 1
      compression += counter.to_s + str[i]
      counter = 0
    elsif str[i] != str[i + 1] && counter == 1
      compression += str[i]
      counter = 0
    end
    i += 1
  end
  return compression
end

=begin
'3a'
current el = ''
counter = 0 + 1 + 1 + 1
  a a a b
=end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
