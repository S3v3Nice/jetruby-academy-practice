# frozen_string_literal: true

require 'rspec'
require_relative '../pokemon_array'

RSpec.describe 'Pokemon array' do
  before do
    allow_any_instance_of(Kernel).to receive(:print)
    allow_any_instance_of(Kernel).to receive(:puts)
  end

  it 'zero' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('0')
    expect(pokemon_array).to eq([])
  end

  it 'one' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('1', 'Pikachu', 'yellow')
    expect(pokemon_array).to eq([{ name: 'Pikachu', color: 'yellow' }])
  end

  it 'two' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('2', 'eevee', 'Brown', 'BULBASAUR', 'green')
    expect(pokemon_array).to eq([{ name: 'eevee', color: 'Brown' }, { name: 'BULBASAUR', color: 'green' }])
  end
end
