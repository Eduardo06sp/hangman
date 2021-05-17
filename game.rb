# frozen_string_literal: true

class Game
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
