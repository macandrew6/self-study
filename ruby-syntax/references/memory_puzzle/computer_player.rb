class ComputerPlayer
  attr_accessor :previous_guess, :board_size

  def initialize(size)
    @board_size = size
    @matched_cards = {}
    @known_cards = {}
    @previous_guess = nil
  end
  
end