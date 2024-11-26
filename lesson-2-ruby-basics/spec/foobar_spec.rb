# frozen_string_literal: true

require 'rspec'
require_relative '../foobar'

RSpec.describe 'Foobar' do
  before do
    allow_any_instance_of(Kernel).to receive(:print)
  end

  it '10 and 15' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('10', '15')
    expect(foobar).to eq(25)
  end

  it '10 and 20' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('10', '20')
    expect(foobar).to eq(20)
  end

  it '20 and 15' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('20', '15')
    expect(foobar).to eq(15)
  end
end
