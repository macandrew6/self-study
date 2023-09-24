# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0
    sorted = self.sort
    return sorted[-1] - sorted[0]
  end
end
