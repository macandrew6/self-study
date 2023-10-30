class Maze
  # attr_reader

  DELTAS = [[1, 0], [0, 1], [-1, 0], [0, -1]]

  def initialize(filename)
    @map = load_map(filename)
    @title = parse_title(filename)
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

  def parse_title(filename)
    filename.match(/(.+)\.txt/)[1]
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

  def to_s
    string = "MAZE: #{@title}\n"

    @map.each do |line|
      string << line.join("")
    end

    string
  end

  def is_wall?(point)
    x, y = point
    @map[x][y] == "*"
  end

  def in_maze?(point)
    x, y = point
    not_negative = x >= 0 && y >= 0
    in_bounds = x <= @map[0].length && y <= @map.length
    not_negative && in_bounds
  end
    
  def find_neighbors(point)
    p_x, p_y = point
    neighbors = []

    DELTAS.each do |d_x, d_y|
      neighbor = [(d_x + p_x), (d_y + p_y)]
      if in_maze?(neighbor) && !is_wall?(neighbor)
        neighbors << neighbor
      end
    end

    return neighbors
  end

  def travel_path(path)
    copy_map = deep_dup(@map)
    show_path(copy_map)
  end

  def show_path(map)
    map.each do |line|
      puts line.join("")
    end
  end

  private

  def deep_dup(items)
    unless items.class == Array
      items.dup
    else
      new_arr = []
      items.each do |item|
        new_arr << deep_dup(item)
      end
      new_arr
    end
  end
end

path = [[1, 6], [1, 5], [1, 4], [1, 3], [1, 2], [1, 1], [2, 1], [2, 2]]
maze = Maze.new("maze.txt")
p maze.travel_path(path)