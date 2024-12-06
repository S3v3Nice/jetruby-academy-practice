# frozen_string_literal: true

def input_pokemon_array
  pokemon_array = []

  print 'Pokemon count: '
  pokemon_count = gets.chomp.to_i

  pokemon_count.times do |i|
    puts "Pokemon ##{i + 1}:"
    pokemon_array.push(input_pokemon)
  end

  pokemon_array
end

def input_pokemon
  print "\tName: "
  name = gets.chomp

  print "\tColor: "
  color = gets.chomp

  { name:, color: }
end
