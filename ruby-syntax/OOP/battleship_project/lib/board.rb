class Board
  attr_reader :size

  def initialize(n)
    grid = Array.new(n) {Array.new(n)}
    (0...n).each do |row|
      (0...n).each do |col|
        grid[row][col] = :N
      end
    end

    @grid = grid
    @size = n * n
  end

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(position, value)
    row, col = position
    @grid[row][col] = value
  end

  def num_ships
    count = 0

    (0...@grid.length).each do |row|
      (0...@grid.length).each do |col|
        count += 1 if @grid[row][col] == :S
      end
    end
    
    count
  end
end
