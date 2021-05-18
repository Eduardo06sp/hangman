# frozen_string_literal: true

require_relative 'game'

def validate_input(input, valid_entries)
  until valid_entries.include?(input)
    puts "Please enter: #{valid_entries.join(' ')}"
    input = gets.chomp
  end

  input
end

def load_game
  save = File.open('saves/latest_save.txt', 'r') do |file|
    YAML.load(file)
  end

  save.play_rounds
end

def create_game
  new_game = Game.new(Game.random_word)
  new_game.play_rounds
end

def intro
  puts 'Welcome!'

  if File.exist?('saves/latest_save.txt')
    puts 'Would you like to load your latest save?'
    input = gets.chomp
    input = validate_input(input, %w[yes y no n])

    if %w[yes y].include?(input)
      load_game
    else
      create_game
    end
  else
    create_game
  end
end

intro
