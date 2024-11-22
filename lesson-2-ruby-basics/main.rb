# frozen_string_literal: true

require_relative 'greeting'
require_relative 'foobar'

puts 'Select function:
  1 - greeting;
  2 - foobar.'

loop do
  print 'Which function [1/2]? '
  num = gets.chomp

  if num == '1'
    puts greeting
    break
  end

  if num == '2'
    puts foobar
    break
  end
end
