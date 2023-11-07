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
  end

  def manhattan_heuristic(queue)
    queue.inject do |chosen_point, point|
      old_f = find_manhattan_estimate(chosen_point)
      new_f = find_manhattan_estimate(point)
      old_f > new_f ? point : chosen_point
    end
  end

  def build_branching_paths(heuristic = :manhattan_heuristic)
    reset_values
    queue = [@current]
    visited = [@current]
    
    until queue.empty? || @current == @maze.find_end
      # p "the queue: #{queue}"
      # p "the visited: #{visited}"
      @current = self.send(heuristic, queue)
      queue.delete(@current)
      visited << @current

      nearby_openings = @maze.find_neighbors(@current)

      nearby_openings.each do |neighbor|
        unless visited.include?(neighbor) || queue.include?(neighbor)
          queue << neighbor
          @branching_paths[neighbor] = @current
        end
      end
    end

    @branching_paths
  end

  def solve(heuristic = :manhattan_heuristic)
    build_branching_paths(heuristic)
    path = find_path
    p "the path : #{path}"
    @maze.travel_path(path)
  end

  private
  
  def reset_values
    @branching_paths = {}
    @current = @maze.find_start
  end
end
if __FILE__ == $PROGRAM_NAME
  filename = ARGV[0] || "maze.txt"
  test_maze = Maze.new(filename)
  puts test_maze
  puts "Start is at #{test_maze.find_start}"
  puts "End is at #{test_maze.find_end}"
  solver = Solver.new(test_maze)
  solver.solve
end