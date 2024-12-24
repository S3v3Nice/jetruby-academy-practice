# frozen_string_literal: true

require_relative 'input_and_process_word'
require_relative 'input_pokemon_array'

puts "Select function:
\t1 - input_and_process_word;
\t2 - input_pokemon_array."

loop do
  print 'Which function [1/2]? '
  num = gets.chomp

  if num == '1'
    puts input_and_process_word
    break
  end

  if num == '2'
    puts input_pokemon_array.to_s
    break
  end
end
