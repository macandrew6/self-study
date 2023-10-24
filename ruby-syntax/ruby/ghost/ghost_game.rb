require "set"
require_relative "player"

class Game
  ALPHA = ('a'..'z').to_a
  MAX_LOSS_COUNT = 5

  def initialize(*players)
    words = File.readlines("dictionary.txt").map(&:chomp)
    @players = players
    @fragment = ''
    @dictionary = Set.new(words)
    @losses = Hash.new {|losses, player| losses[player] = 0}
  end

  def current_player
    @players.first
  end

  def previous_player
    @players.last
  end

  def next_player!
    @players.rotate!
  end

  def add_letter(letter)
    @fragment += letter
  end

  def play_round
    p 'Welcome!'
    p "Lets play a round of GHOST"
    until round_over?
      take_turn
      next_player!
    end
  end

  def run
    until game_over?
      play_round
    end
  end

  def display_standings
    p "Current standings are: "
    players.each do |player|
      p "#{player.name} has : #{record(player)}"
    end
  end

  def game_over?
    remaining_players == 1
  end

  def remaining_players
    losses.count {|k, v| v < MAX_LOSS_COUNT}
  end
  
  def record(player)
    count = losses[player]
    'GHOST'.slice(0..count)
  end

  def take_turn
    guess = nil
    until valid_play?(guess)
      guess = current_player.guess

      if !valid_play?(guess)
        current_player.alert_invalid_guess(guess)
      end
    end

    add_letter(guess)
    p "#{current_player.name} has added #{guess}. The new fragment is #{@fragment}"
  end

  def valid_play?(str)
    return false if !ALPHA.include?(str)
    new_frag = @fragment + str
    @dictionary.any? do |word|
      word.start_with?(new_frag)
    end
  end

  def losses
    losses[current_player] += 1
  end

  def round_over?
    dictionary.include?(fragment)
  end
end

player1 = Player.new('Catniss')
player2 = Player.new('Peta')
game = Game.new(player1, player2)
p game.take_turn