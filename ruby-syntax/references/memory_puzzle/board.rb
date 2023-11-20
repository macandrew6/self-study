require_relative "card.rb"

class Board
  def initialize(size = 4)
    @grid = Array.new(size) { Array.new(size) }
    @size = size
  end

  def populate

  end

  def render

  end
end

p card = Card.new("A")
board = Board.new
p board