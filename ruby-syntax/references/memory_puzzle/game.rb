require_relative 'board'
require_relative 'human_player'

class Game
  attr_reader :player

  def initialize (player, size=4)
    @board = Board.new(size)
    @prev_guess = nil
    @player = player
  end

  def get_player_input
    pos = nil

    until pos && valid_pos?(pos)
      pos = player.get_input
    end

    pos
  end
  
  def valid_pos?(pos)
    pos.is_a?(Array) &&
      pos.count == 2 &&
      pos.all? {|x| x.between?(0, board.size - 1)}
  end

  def match?(pos1, pos2)
    board[pos1] == board[pos2]
  end

  def play
    until board.won?
      board.render
      pos = get_player_input
    end

    'Puts congratulation you are the winner'
  end

  private

  attr_accessor :prev_guess
  attr_reader :board
end

if PROGRAM_NAME == __FILE__
  size = ARGV.empty? ? 4 : ARGV.shift.to_i
  Game.new(HumanPlayer.new(size), size).play
end