require_relative "card.rb"

class Board
  attr_reader :size

  def initialize(size = 4)
    @grid = Array.new(size) { Array.new(size) }
    @size = size
  end

  def populate
    num_pairs = (size**2)/2
    cards = Card.shuffled_pairs(num_pairs)
    p grid
  end

  def render

  end

  private
  
  attr_reader :grid
end

p card = Card.new("A")
board = Board.new
p board.populate