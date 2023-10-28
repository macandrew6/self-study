class Maze
  attr_reader :map

  def initialize(filename)
    @map = load_map(filename)
    @start_idx = find_start
    @end_idx = find_end
  end

  def load_map(filename)
    maze = []
    File.open(filename).each do |line|
      chars = line.split("")
      maze << chars
    end
    maze
  end

  def find_start
    find_char("S")
  end

  def find_end
    find_char("E")
  end

  def find_char(char)
    @map.each_with_index do |line, y|
      return [line.index(char), y] if line.index(char)
    end
  end
end

maze = Maze.new("maze.txt")
p maze.load_map("maze.txt")
