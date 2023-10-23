class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def guess
    p "Add a letter: "
    res = gets.chomp
    res.downcase
  end
end