# frozen_string_literal: true

require_relative 'word_ending_with_cs'
require_relative 'pokemon_array'

puts "Select function:
\t1 - word_ending_with_cs;
\t2 - pokemon_array."

loop do
  print 'Which function [1/2]? '
  num = gets.chomp

  if num == '1'
    puts word_ending_with_cs
    break
  end

  if num == '2'
    puts pokemon_array.to_s
    break
  end
end
