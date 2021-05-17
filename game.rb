# frozen_string_literal: true

class Game
  attr_accessor :moves, :secret_hint
  attr_reader :secret_word

  def initialize(secret_word)
    @secret_word = secret_word
    @moves = ('a'..'z').to_a
    @wrong_guesses = []
    @guesses_left = 6
    @secret_hint = Array.new(secret_word.length) { '_' }
  end

  def play_rounds
    puts 'Make a guess, or type SAVE to save the game:'
    input = gets.chomp
    input = validate_input(input, moves + ['SAVE'])

    if secret_word.include?(input)
      update_hint(input)
    end

    update_moves(input)
  end

  def update_moves(input)
    moves.delete(input)
  end

  def update_hint(input)
    secret_word.split('').each_with_index do |secret_letter, index|
      secret_hint[index] = secret_letter if input == secret_letter
    end
  end

  def validate_input(input, valid_entries)
    until valid_entries.include?(input)
      puts "Please enter: #{valid_entries.join(' ')}"
      input = gets.chomp
    end

    input
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
