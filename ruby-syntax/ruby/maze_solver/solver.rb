require_relative "maze.rb"

class Solver
  def initialize(maze)
    @maze = maze
    reset_values
  end

  def find_distance(point)
    p_x, p_y = point
    final_x, final_y = @maze.find_end
    ((p_x + final_x), (p_y + final_y)).abs
  end

  def find_path(goal = @maze.find_end)

  end

  private
  
  def reset_values
    @branching_paths = {}
    @current = @maze.find_start
  end
end

path = [[1, 6], [1, 5], [1, 4], [1, 3], [1, 2], [1, 1], [2, 1], [3, 1], [4, 1], [5, 1], [6, 1], [7, 1]]
filename = ARGV[0] || "maze.txt"
test_maze = Maze.new(filename)
test_maze.travel_path(path)
solver = Solver.new(test_maze)
p solver