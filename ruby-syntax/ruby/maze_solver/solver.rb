require_relative "maze.rb"

class Solver
  def initialize(maze)
    @maze = maze
    reset_values
  end

  def find_distance(point)
    p_x, p_y = point
    final_x, final_y = @maze.find_end
    ((p_x - final_x) + (p_y - final_y)).abs
  end

  def find_path(goal = @maze.find_end)
    path = [goal]
    spot = goal

    until @branching_paths[spot] == nil
      path << @branching_paths[spot]
      spot = @branching_paths[spot]
    end

    path
  end

  def find_manhattan_estimate(point)
    dist_to_end = find_distance(point)
    dist_traveled = find_path(point).length
    f = dist_to_end + dist_traveled
    # return f
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
p test_maze.find_end
p solver.find_path
p solver.find_distance([1, 2])
p solver.find_manhattan_estimate([14, 1])
# p solver