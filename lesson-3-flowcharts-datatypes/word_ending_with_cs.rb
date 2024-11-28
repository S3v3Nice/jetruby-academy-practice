# frozen_string_literal: true

def word_ending_with_cs
  loop do
    print 'Word: '
    word = gets
    word = word.strip if word

    next unless word && !word.include?(' ')

    return word.downcase.end_with?('cs') ? (2 ** word.length) : word.reverse
  end
end
