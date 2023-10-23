require "set"


class Game
  def initialize(*players)
    words = File.readlines("dictionary.txt").map(&:chomp)
    @players = players
    @fragment = ''
    @dictionary = Set.new(words)
  end
end

game = Game.new('player')
p game