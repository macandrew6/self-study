class Board
  attr_reader :grid

  def initialize(n)
    grid = Array.new(n) { Array.new(n) { '_' } }
    @grid = grid
  end

  def valid?(position)
    row, col = position
    if row < @grid.length && col < @grid.length && row >= 0 && col >= 0
      return true
    end
    false
  end

  def empty?(position)
    row, col = position
    if @grid[row][col] == '_'
      return true
    else
      return false
    end
  end

  def place_mark(position, mark)
    row, col = position
    if valid?(position) && empty?(position)
      @grid[row][col] = mark
    elsif valid?(position) && !empty?(position)
      raise 'this position has already been taken'
    elsif !valid?(position) && empty?(position)
      raise 'this position is out of bounds'
    end
  end

  def print
    @grid.each do |row|
      puts '| ' + row.join(' | ') + ' |'
    end
  end

  def win_row?(mark)
    @grid.any? {|row| row.all? {|el| el == mark}}
  end

  def win_col?(mark)
    @grid.transpose.any? {|col| col.all? {|el| el == mark}}
  end

  def win_diagonal?(mark)
    upper_left_to_bottom_right = []
    bottom_left_to_upper_right = []
    row = 0
    col = 0
    while row < @grid.length
      upper_left_to_bottom_right << @grid[row][col]
      row += 1
      col += 1
    end
    row = @grid.length - 1
    col = 0
    while col < @grid.length
      bottom_left_to_upper_right << @grid[row][col]
      row -= 1
      col += 1
    end
    upper_left_to_bottom_right.all? {|el| el == mark} || bottom_left_to_upper_right.all? {|el| el == mark}
  end

  def win?(mark)
    return true if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    false
  end

  def empty_positions?
    @grid.any? do |row|
      row.any? {|spot| spot == '_'}
    end
  end
end


# board = Board.new(4)

# board.place_mark([0, 0], :X)
# board.place_mark([0, 1], :X)
# board.place_mark([0, 2], :X)
# board.place_mark([1, 0], :X)
# board.place_mark([1, 1], :X)
# board.place_mark([1, 2], :X)
# board.place_mark([2, 0], :X)
# board.place_mark([2, 1], :X)
# # board.place_mark([2, 2], :X)
# board.print
# board.win_col?(:X)
# board.win?(:X)
# p board.empty_positions?
