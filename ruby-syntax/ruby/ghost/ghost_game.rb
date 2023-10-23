require "set"
require_relative "player"

class Game
  def initialize(player1, player2)
    words = File.readlines("dictionary.txt").map(&:chomp)
    @players = [player1, player2]
    @fragment = ''
    @dictionary = Set.new(words)
  end

  def current_player
    @players.first
  end

  def previous_player
    @players.last
  end

  def next_player
    @players.rotate!
  end
end

player1 = Player.new('Catniss')
player2 = Player.new('Peta')
game = Game.new(player1, player2)
p game