class Solver
  def initialize(maze)
    @maze = maze
    @branching_paths = {}
    @current = @maze.find_start
  end
end

solver = Solver.new
p solver