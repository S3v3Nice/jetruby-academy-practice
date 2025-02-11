# frozen_string_literal: true

def input_and_process_word
  print 'Word: '
  word = gets.strip

  word.downcase.end_with?('cs') ? (2 ** word.length) : word.reverse
end
