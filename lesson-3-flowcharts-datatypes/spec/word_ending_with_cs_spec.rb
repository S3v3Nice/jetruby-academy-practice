# frozen_string_literal: true

require 'rspec'
require_relative '../word_ending_with_cs'

RSpec.describe 'Word ending with cs' do
  before do
    allow_any_instance_of(Kernel).to receive(:print)
  end

  it 'Hello' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(' Hello ')
    expect(word_ending_with_cs).to eq('olleH')
  end

  it 'Hello world -> cat' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Hello world', 'cat')
    expect(word_ending_with_cs).to eq('tac')
  end

  it 'cs' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('cs')
    expect(word_ending_with_cs).to eq(4)
  end

  it 'abcS' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('abcS')
    expect(word_ending_with_cs).to eq(16)
  end
end
