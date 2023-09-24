# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0
    sorted = self.sort
    return sorted[-1] - sorted[0]
  end

  def average
    return nil if self.length == 0
    self.sum / (self.length * 1.0)
  end

  def median
    return nil if self.length == 0
    sorted = self.sort
    mid = self.length / 2
    if self.length % 2 != 0
      sorted[mid]
    else
      [sorted[mid - 1], sorted[mid]].average
    end
  end

  def counts
    count_hash = Hash.new(0)

    self.each do |el|
      count_hash[el] += 1
    end

    count_hash
  end

  def my_count(value)
    counter = 0

    self.each do |el|
      counter += 1 if el == value
    end

    counter
  end

  def my_index(value)
    self.each_with_index do |el, i|
      return i if el == value
    end

    nil
  end

  def my_uniq

  end
end
