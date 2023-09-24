class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end

  def initialize ()
    @secret_word = Hangman.random_word
    @guess_word = @secret_word.split('').map {|letter| '_'}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end
  
  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted? (char)
    if @attempted_chars.include?(char)
      return true
    else
      return false
    end
  end

  def get_matching_indices (char)
    matching_indicies = []
    @secret_word.each_char.with_index do |el, i|
      matching_indicies << i if el == char
    end

    return matching_indicies
  end

  def fill_indices (char, array_of_indicies)
    array_of_indicies.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess (char)
    if get_matching_indices(char).length == 0
      @remaining_incorrect_guesses -= 1
    end

    fill_indices(char, get_matching_indices(char))

    if already_attempted?(char)
      p 'that has already been attempted'
      return false
    else
      @attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
    p 'Enter a char:'
    guess = gets.chomp
    try_guess(guess)
  end

  def win?
    if @guess_word.join('') == @secret_word
      p 'WIN'
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    else
      return false
    end
  end
end
