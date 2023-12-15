class HumanPlayer
  def initialize
    @prev_guess = nil
  end

  def get_input
    prompt
    parse(STDIN.gets.chomp)
  end

  def prompt
    puts "Please enter the position of the card you'd like to flip (e.g., '2,3')"
    print "> "
  end

  def parse(string)
    string.split(',').map {|x| Integer(x)}
  end
end