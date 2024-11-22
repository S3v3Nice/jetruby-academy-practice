# frozen_string_literal: true

def foobar
  print 'First number: '
  first = gets.chomp.to_i

  print 'Second number: '
  second = gets.chomp.to_i

  if first == 20 || second == 20
    second
  else
    first + second
  end
end

puts foobar
