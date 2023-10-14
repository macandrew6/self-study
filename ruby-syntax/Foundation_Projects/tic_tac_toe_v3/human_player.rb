class Human_player
  attr_reader :mark_value
  
  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position
    p "Player #{@mark_value} enter your position as two numbers with a space between them: ex.(`row col`) "
    position = gets.chomp

    pos_nums = position.split(' ')

    if pos_nums.length < 2
      raise 'Invalid input: missing coordinate'
    end

    valid_entries = ("0".."1000").to_a
    pos_nums.each do |num|
      raise "You've entered something other than an integer"if !valid_entries.include?(num)
    end
    
    pos_nums.map(&:to_i)
  end
end

human = Human_player.new(:X)