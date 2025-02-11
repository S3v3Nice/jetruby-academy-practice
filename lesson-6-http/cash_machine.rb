# frozen_string_literal: true

class CashMachine
  START_BALANCE = 100.0

  attr_reader :balance

  def initialize(balance_file_name)
    @balance_file_name = balance_file_name
    @balance = START_BALANCE
    load_balance
  end

  def deposit(amount)
    raise 'Invalid deposit amount!' if amount.negative?

    @balance += amount
    save_balance
  end

  def withdraw(amount)
    if amount.negative? || amount > @balance
      raise 'Invalid withdraw amount!'
    end

    @balance -= amount
    save_balance
  end

  private

  def load_balance
    return unless File.exist? @balance_file_name

    File.open(@balance_file_name) do |f|
      @balance = f.first.chomp.to_f
    end
  end

  def save_balance
    File.write(@balance_file_name, @balance)
  end
end
