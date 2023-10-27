class Maze
  attr_reader :map

  def initialize(filename)
    @map = load_map(filename)
  end

  def load_map(filename)
    maze = []
    File.open(filename).each do |line|
      chars = line.split("")
      maze << chars
    end
    maze
  end
end

maze = Maze.new("maze.txt")
p maze.load_map("maze.txt")
