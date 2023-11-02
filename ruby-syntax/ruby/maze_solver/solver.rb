class Solver
  def initialize(maze)
    @maze = maze
    reset_values
  end

  private
  
  def reset_values
    @branching_paths = {}
    @current = @maze.find_start
  end
end

solver = Solver.new
p solver