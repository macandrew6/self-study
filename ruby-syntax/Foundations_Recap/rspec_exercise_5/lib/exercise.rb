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
p zany_zip(a1, a2)
p zany_zip(a3)