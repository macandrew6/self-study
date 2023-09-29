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

  def attack(position)
    if self[position] == :S
      self[position] = :H
      p 'You sunk my battleship'
      return true
    else
      self[position] = :X
      return false
    end
  end

  #sets 25% of grid to :S
  def place_random_ships
    ships = @size * 0.25

    while ships != 0
      rand_row = rand(@grid.length)
      rand_col = rand(@grid.length)
      rand_position = [rand_row, rand_col]

      if self[rand_position] != :S
        self[rand_position] = :S
        ships -= 1
      end
    end
  end
end
