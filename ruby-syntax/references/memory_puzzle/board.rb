require_relative "card.rb"

class Board
  def initialize(size = 4)
    @grid = Array.new(size) { Array.new(size) }
    @size = size
  end

  def populate
    num_pairs = (size**2)/2
    Card.shuffled_pairs(num_pairs)
  end

  def render

  end
end

p card = Card.new("A")
board = Board.new
p board