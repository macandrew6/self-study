require_relative "card.rb"

class Board
  attr_reader :size

  def initialize(size = 4)
    @grid = Array.new(size) { Array.new(size) }
    @size = size
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def populate
    num_pairs = (size**2)/2
    cards = Card.shuffled_pairs(num_pairs)
    grid.each_index do |i|
      grid[i].each_index do |j|
        self[[i, j]] = cards.pop
      end
    end
  end

  def render

  end

  private
  
  attr_reader :grid
end

p card = Card.new("A")
board = Board.new
p board.populate