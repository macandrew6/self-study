def reverser (string, &prc)
  prc.call(string.reverse)
end

def word_changer (sentence_str, &prc)
  changer_arr = []

  sentence_str.split(' ').each do |el|
    changer_arr << prc.call(el)
  end

  changer_arr.join(' ')
end

def greater_proc_value (num, prc1, prc2)
  prc1_value = prc1.call(num)
  prc2_value = prc2.call(num)

  [prc1_value, prc2_value].max
end

def and_selector (array, prc1, prc2)
  selected = []

  array.each do |el|
    if (prc1.call(el) && prc2.call(el))
      selected << el
    end
  end

  selected
end

def alternating_mapper (array, prc1, prc2)
  mapped = []

  array.each_with_index do |el, i|
    if i % 2 == 0
      mapped << prc1.call(el)
    else
      mapped << prc2.call(el)
    end
  end

  mapped
end