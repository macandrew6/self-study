class Human_player
  attr_reader :mark_value
  
  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position(legal_positions)
    pos_num = nil
    valid_entries = ("0".."1000").to_a

    while !legal_positions.include?(pos_num)
      p "Player #{@mark_value} enter your position as two numbers with a space between them: ex.(`row col`) "
      input = gets.chomp.split(' ')

      input.each do |num|
        p "i am here this is #{num}"
        raise "You've entered something other than an integer" if !valid_entries.include?(num)
      end

      pos_num = input.map(&:to_i)
      
      raise 'Invalid input: not enough inputs' if pos_num.length < 2
      p "#{pos_num} is not a legal position" if !legal_positions.include?(pos_num)
    end
    pos_num.each do |num|
      p "i am here this is #{num}"
      raise "You've entered something other than an integer" if valid_entries.include?(num)
    end

    pos_num
  end
end

human = Human_player.new(:X)