require "set"
require_relative "player"

class Game
  ALPHA = ('a'..'z').to_a

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

  def add_letter(letter)
    @fragment += letter
  end

  def take_turn
    guess = nil
    until valid_play?(guess)
      guess = current_player.guess

      if !valid_play?(guess)
        p "this is an invalid guess"
      end
    end

    add_letter(guess)
    p "#{current_player} has added #{guess} to the fragment"
  end

  def valid_play?(str)
    return false if !ALPHA.include?(str)
    new_frag = @fragment + str
    @dictionary.any? do |word|
      word.start_with?(new_frag)
    end
  end
end

player1 = Player.new('Catniss')
player2 = Player.new('Peta')
game = Game.new(player1, player2)
p game.take_turn