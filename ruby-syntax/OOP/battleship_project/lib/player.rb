class Player
  def get_move
    #needs to add boundary based on board size
    p 'enter a position with coordinates separated with a space like `4 7`'
    user_input = gets.chomp
    user_input.split(' ').map(&:to_i)
  end
end
