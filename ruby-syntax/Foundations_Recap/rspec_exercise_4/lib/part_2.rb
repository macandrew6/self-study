def proper_factors(num)
  (1...num).select {|n| num % n == 0}
end

# p proper_factors(28)
# p proper_factors(6)
# p proper_factors(60)

def aliquot_sum(num)
  proper_factors = proper_factors(num)
  proper_factors.sum  
end

# p aliquot_sum(28)
# p aliquot_sum(6)
# p aliquot_sum(60)

def perfect_number?(num)
  num == aliquot_sum(num)
end

# p perfect_number?(28)
# p perfect_number?(6)
# p perfect_number?(60)

def ideal_numbers(n)
  array = []
  num = 0

  while array.length < n
    num += 1
    if perfect_number?(num)
      array << num
    end
  end

  array
end

# p ideal_numbers(4)
# p ideal_numbers(10)
# p ideal_numbers(1)
