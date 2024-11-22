# frozen_string_literal: true

require 'rspec'
require_relative '../greeting'

RSpec.describe 'Greeting' do
  before do
    allow_any_instance_of(Kernel).to receive(:print)
  end

  it '17 years old' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Ivan', 'Ivanov', '17')
    expect(greeting).to eq("Hi Ivan Ivanov, you're under 18, but it's never too early to start learning programming!")
  end

  it '18 years old' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('John', 'Smith', '18')
    expect(greeting).to eq("Hi John Smith, it's time to get down to business!")
  end

  it '19 years old' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Ann', 'Watson', '19')
    expect(greeting).to eq("Hi Ann Watson, it's time to get down to business!")
  end
end
