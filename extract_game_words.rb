# frozen_string_literal: true

all_words_file = File.open('5desk.txt', 'r')

game_words = []
all_words_file.each do |line|
  word = line.strip
  game_words.push(word) if word.length >= 5 && word.length <= 12
end

all_words_file.close
game_words_file = File.open('game_words.txt', 'w+')

game_words.each do |word|
  game_words_file.puts(word)
end

game_words_file.close
