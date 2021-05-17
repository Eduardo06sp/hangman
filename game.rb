# frozen_string_literal: true

class Game
  def initialize(secret_word)
    @secret_word = secret_word
    @wrong_guesses = []
    @guesses_left = 6
    @secret_hint = Array.new(secret_word.length) { '_' }
  end

  def play_rounds
  end

  def self.random_word
    game_words = []

    game_words_file = File.open('game_words.txt', 'r')
    game_words_file.each do |line|
      word = line.strip
      game_words.push(word)
    end
    game_words_file.close

    game_words.sample
  end
end
