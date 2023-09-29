class Board
  def initialize(n)
    grid = Array.new(n) {Array.new(n)}
    (0...n).each do |row|
      (0...n).each do |col|
        grid[row][col] = :N
      end
    end
    
    @grid = grid
    
  end
end
