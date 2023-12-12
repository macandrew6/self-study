require_relative "card.rb"

class Board
  attr_reader :size

  def initialize(size = 4)
    @grid = Array.new(size) { Array.new(size) }
    @size = size
    populate
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def hide(pos)
    self[pos].hide
  end

  def reveal(pos)
    if revealed?(pos)
      puts "You can't flip a card if it's already been revealed"
    else
      self[pos].reveal
    end
    self[pos].face_value
  end

  def revealed?(pos)
    self[pos].revealed?
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
    system("clear")
    puts "  #{(0...size).to_a.join(' ')}"
    grid.each_with_index do |row, i|
      puts "#{i} #{row.join(' ')}"
    end
  end

  def won?
    rows.all? do |row|
      row.all?(&:revealed?)
    end
  end

  private
  
  attr_reader :grid
end

board = Board.new
board.hide([1, 2])
p board.reveal([1, 2])
p board.reveal([3, 2])
p board.reveal([3, 3])
p board.reveal([3, 1])
p board.reveal([3, 0])
p board.render