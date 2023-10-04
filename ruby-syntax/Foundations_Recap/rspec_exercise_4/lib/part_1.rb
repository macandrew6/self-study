def my_reject(array, &prc)
  array.select {|el| prc.call(el) == false}
end

def my_one?(array, &prc)
  count = 0

  array.each do |el|
    if prc.call(el) == true
      count += 1
    end
  end

  count == 1
end

def hash_select(hash, &prc)
  new_hash = Hash.new

  hash.each do |k, v|
    if prc.call(k, v) == true
      new_hash[k] = v
    end
  end

  new_hash
end

def xor_select(array, prc_1, prc_2)
  new_array = []
  
  array.each do |el|
    if prc_1.call(el) == true && prc_2.call(el) == false
      new_array << el
    elsif prc_1.call(el) == false && prc_2.call(el) == true
      new_array << el
    end
  end

  new_array
end

def proc_count(val, arr_of_procs)
  count = 0

  arr_of_procs.each do |prc|
    count += 1 if prc.call(val) == true
  end

  count
end