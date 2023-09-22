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