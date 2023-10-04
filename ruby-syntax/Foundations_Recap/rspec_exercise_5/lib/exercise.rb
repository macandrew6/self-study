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

