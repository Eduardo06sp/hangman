# frozen_string_literal: true

require_relative 'game'

def intro
  puts 'Welcome!'

  if File.exist?('saves/latest_save.txt')
    puts 'Would you like to load your latest save?'
    input = gets.chomp

    unless %w[yes y no n].include?(input)
      puts 'Please type in: yes y no n'
      input = gets.chomp
    end

    if %[yes y].include?(input)
      save = File.open('saves/latest_save.txt', 'r') do |file|
        YAML.load(file)
      end

      save.play_rounds
    else
      new_game = Game.new(Game.random_word)
      new_game.play_rounds
    end
  else
    new_game = Game.new(Game.random_word)
    new_game.play_rounds
  end
end

intro
