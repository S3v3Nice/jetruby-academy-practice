# frozen_string_literal: true

require 'rspec'
require_relative '../input_and_process_word'

RSpec.describe '#input_and_process_word' do
  before do
    allow_any_instance_of(Kernel).to receive(:print)
  end

  it 'receives " Hello "' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(' Hello ')
    expect(input_and_process_word).to eq('olleH')
  end

  it 'receives "cat"' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('cat')
    expect(input_and_process_word).to eq('tac')
  end

  it 'receives "cs"' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('cs')
    expect(input_and_process_word).to eq(4)
  end

  it 'receives "abcS"' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('abcS')
    expect(input_and_process_word).to eq(16)
  end
end
