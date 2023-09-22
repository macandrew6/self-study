def my_map (array, &prc)
  map_arr = []

  array.each do |el|
    map_arr << prc.call(el)
  end

  return map_arr
end

def my_select (array, &prc)
  select_arr = []

  array.each do |el|
    select_arr << el if prc.call(el) == true
  end

  return select_arr
end

def my_count (array, &prc)
  count = 0

  array.each do |el|
    count += 1 if prc.call(el) == true
  end

  return count
end

def my_any? (array, &prc)
  array.each do |el|
    return true if prc.call(el) == true
  end

  return false
end

def my_all? (array, &prc)
  array.each do |el|
    return false if prc.call(el) == false
  end

  return true
end

def my_none? (array, &prc)
  array.each do |el|
    if prc.call(el) == true
      return false
    end
  end
  return true
end