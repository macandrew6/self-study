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

  def compare_guess(new_guess)
    if prev_guess
      if match?(prev_guess, new_guess)
        player.receive_match(prev_guess, new_guess)
      else
        puts "Try again"
        [prev_guess, new_guess].each {|pos| board.hide(pos)}
      end
      self.prev_guess = nil
      player.prev_guess = nil
    else
      self.prev_guess = new_guess
      player.prev_guess = new_guess
    end
  end

  def make_guess(pos)
    reveal_value = board.reveal(pos)
    player.receive_revealed_card(pos, reveal_value)
    board.render
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

if $PROGRAM_NAME == __FILE__
  size = ARGV.empty? ? 4 : ARGV.shift.to_i
  memory = Game.new(HumanPlayer.new(size), size)
  memory.make_guess([0, 2])
  memory.make_guess([1, 1])
  memory.make_guess([0, 1])
  memory.make_guess([0, 3])
  # memory.play
end