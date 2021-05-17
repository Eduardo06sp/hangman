# frozen_string_literal: true

require_relative 'game_interface'

class Game
  include GameInterface

  attr_accessor :moves, :secret_hint, :guesses_left, :wrong_guesses
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
    else
      update_wrong_guesses(input)
    end

    update_moves(input)
    self.guesses_left -= 1

    if secret_hint.join == secret_word
      end_game('win')
    elsif guesses_left.zero?
      end_game('loss')
    else
      play_rounds
    end
  end

  def update_wrong_guesses(input)
    wrong_guesses.push(input)
  end

  def rematch
    puts 'Rematch?'
    input = gets.chomp
    input = validate_input(input, %w[yes y no n])

    if %w[yes y].include?(input)
      new_game = Game.new(Game.random_word)
      new_game.play_rounds
    else
      puts 'Thanks for playing!'
      puts 'Have a wonderful day. :}'
    end
  end

  def end_game(outcome)
    if outcome == 'win'
      puts 'Congratulations! You guessed the word!'
    else
      puts 'Better luck next time!'
    end

    rematch
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
