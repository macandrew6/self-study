class Computer_player
  attr_reader :mark_value
  
  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position(legal_positions)
    comp_pick = legal_positions.sample
    p "Computer players chooses #{comp_pick.to_s}"
    comp_pick
  end
end