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

  def alert_invalid_guess(letter)
    p "This is an invalid guess: #{letter}"
  end
end