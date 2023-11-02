require_relative "maze.rb"

class Solver
  def initialize(maze)
    @maze = maze
    reset_values
  end

  def find_distance(point)
    p_x, p_y = point
  end

  def find_path(point)

  end

  private
  
  def reset_values
    @branching_paths = {}
    @current = @maze.find_start
  end
end

filename = ARGV[0] || "maze.txt"
test_maze = Maze.new(filename)
solver = Solver.new(test_maze)
p solver