# frozen_string_literal: true

require 'rspec'
require_relative '../cash_machine'
require 'rack/test'

RSpec.describe CashMachine do
  let(:balance_file_name) { 'test_balance.txt' }
  let(:cash_machine) { CashMachine.new(balance_file_name) }

  before do
    File.write(balance_file_name, CashMachine::START_BALANCE)
  end

  after do
    File.delete(balance_file_name) if File.exist?(balance_file_name)
  end

  describe '#deposit' do
    it 'increases the balance by the specified amount' do
      expect { cash_machine.deposit(50) }.to change { cash_machine.balance }.by(50)
    end

    it 'raises an error for negative deposit amounts' do
      expect { cash_machine.deposit(-10) }.to raise_error('Invalid deposit amount!')
    end
  end

  describe '#withdraw' do
    it 'decreases the balance by the specified amount' do
      expect { cash_machine.withdraw(50) }.to change { cash_machine.balance }.by(-50)
    end

    it 'raises an error for negative withdrawal amounts' do
      expect { cash_machine.withdraw(-10) }.to raise_error('Invalid withdraw amount!')
    end

    it 'raises an error if withdrawal amount exceeds balance' do
      expect { cash_machine.withdraw(150) }.to raise_error('Invalid withdraw amount!')
    end
  end
end
