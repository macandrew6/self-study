require './board'
require './human_player'

class Game
  attr_reader :players

  def initialize(board_size, *player_marks)
    players = player_marks.map do |player_mark|
      Human_player.new(player_mark)
    end
    @players = players
    @board = Board.new(board_size)
    @player_index = 0
    @current_player = @players[@player_index]
  end

  def switch_turn
    @player_index += 1
    @current_player = @players[@player_index % @players.length]
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

game = Game.new(4, :X, :O, :C)
game.play