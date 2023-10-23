class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def guess
    res = gets.chomp
    res
  end
end