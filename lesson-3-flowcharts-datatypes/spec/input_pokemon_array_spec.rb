# frozen_string_literal: true

require 'rspec'
require_relative '../input_pokemon_array'

RSpec.describe '#input_pokemon_array' do
  before do
    allow_any_instance_of(Kernel).to receive(:print)
    allow_any_instance_of(Kernel).to receive(:puts)
  end

  it 'receives 0 pokemon' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('0')
    expect(input_pokemon_array).to eq([])
  end

  it 'receives 1 pokemon' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('1', 'Pikachu', 'yellow')
    expect(input_pokemon_array).to eq([{ name: 'Pikachu', color: 'yellow' }])
  end

  it 'receives 2 pokemon' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('2', 'eevee', 'Brown', 'BULBASAUR', 'green')
    expect(input_pokemon_array).to eq([{ name: 'eevee', color: 'Brown' }, { name: 'BULBASAUR', color: 'green' }])
  end
end
