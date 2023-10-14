require './board'
require './human_player'

class Game
  def initialize(player_1_mark, player_2_mark)
    @player_1 = Human_player.new(player_1_mark)
    @player_2 = Human_player.new(player_2_mark)
    @board = Board.new
    @current_player = @player_1
  end

  def switch_turn
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def play
    while @board.empty_positions?
      @board.print
      position = @current_player.get_position
      mark = @current_player.mark_value
      @board.place_mark(position, mark)

      if @board.win?(mark)
        p "Congratulations! player: #{mark} WINS"
        return
      else
        self.switch_turn
      end
    end
    p "Draw"
  end
end

game = Game.new(:X, :O)
game.play