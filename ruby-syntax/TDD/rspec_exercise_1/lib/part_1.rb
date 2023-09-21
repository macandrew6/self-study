def average (num1, num2)
  return (num1 + num2)/2.0
end

def average_array (arr)
  sum = 0
  
  arr.each do |num|
    sum += num.to_f
  end

  return sum / arr.length
end

def repeat (str, num)
  repeated_str = ''
  
  num.times do 
    repeated_str += str  
  end

  return repeated_str
end

def yell (str)
  str.upcase + '!'
end

def alternating_case (sentence)
  sent_arr = sentence.split(' ')
  sent_arr.map!.with_index do |el, i|
    if i % 2 == 0
      el.upcase
    else
      el.downcase
    end
  end
  sent_arr.join(' ')
end