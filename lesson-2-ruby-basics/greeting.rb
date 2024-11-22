# frozen_string_literal: true

def greeting
  print 'Enter first name: '
  first_name = gets.chomp

  print 'Enter last name: '
  last_name = gets.chomp

  print 'Enter age: '
  age = gets.chomp.to_i

  if age < 18
    "Hi #{first_name} #{last_name}, you're under 18, but it's never too early to start learning programming!"
  else
    "Hi #{first_name} #{last_name}, it's time to get down to business!"
  end
end

puts greeting
