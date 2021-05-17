# frozen_string_literal: true

require_relative 'game'

def intro
  puts 'Welcome!'

  new_game = Game.new(Game.random_word)
  new_game.play_rounds
end

intro
