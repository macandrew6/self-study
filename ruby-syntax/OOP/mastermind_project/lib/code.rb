class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  def self.random(length)
    random_pegs = []

    length.times do 
      random_pegs << POSSIBLE_PEGS.keys.sample 
    end
    
    Code.new(random_pegs)
  end

  def self.from_string(random_pegs)
    pegs_array = []
    random_pegs.each_char do |peg_char|
      pegs_array << peg_char.upcase
    end

    Code.new(pegs_array)
  end

  def initialize (chars)
    if !Code.valid_pegs?(chars)
      raise 'These are not valid pegs'
    else
      @pegs = chars.map {|peg| peg.upcase}
    end
  end

  def [](index)
    @pegs[index]
  end

  def length 
    @pegs.length
  end

  def num_exact_matches(guess_code)
    count = 0

    guess_code.pegs.each_with_index do |peg, i|
      if @pegs[i] == guess_code.pegs[i]
        count += 1
      end
    end

    return count
  end

  def num_near_matches(guess_code)

  end
end
