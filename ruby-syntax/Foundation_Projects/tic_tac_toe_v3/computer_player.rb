class Computer_player
  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position(legal_positions)
    comp_pick = legal_positions.sample
    p "Computer players chooses #{comp_pick.to_s}"
  end
end