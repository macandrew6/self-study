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

  #something wrong here
  def num_near_matches(guess_code)
    # counter = 0

    # guess_code.pegs.each_with_index do |peg, i|
    #   if self[i] != guess_code[i] && self.pegs.include?(guess_code[i])
    #     counter += 1
    #   end
    # end

    # counter

    count = 0

    (0...guess_code.length).each do |i|
      if guess_code[i] != self[i] && self.pegs.include?(guess_code[i])
        count += 1
      end
    end

    count
  end

  def ==(other_code)
    if other_code.length != self.length
      return false
    end

    (0...self.length).each do |i|
      if self[i] != other_code[i]
        return false
      end
    end

    return true
  end
end
