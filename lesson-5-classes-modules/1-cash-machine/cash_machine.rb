# frozen_string_literal: true

class CashMachine
  START_BALANCE = 100.0

  def initialize(balance_file_name)
    @balance_file_name = balance_file_name
    @balance = START_BALANCE
  end

  def load_balance
    return unless File.exist? @balance_file_name

    File.open(@balance_file_name) do |f|
      @balance = f.first.chomp.to_f
    end
  end

  def save_balance
    File.write(@balance_file_name, @balance)
  end

  def deposit
    loop do
      print 'Deposit amount: '
      amount = gets.chomp.to_f
      if amount.negative?
        puts 'Amount must be greater or equal to 0.'
        next
      end

      @balance += amount
      show_balance
      break
    end
  end

  def withdraw
    loop do
      print 'Withdraw amount: '
      amount = gets.chomp.to_f
      if amount.negative?
        puts 'Amount must be greater or equal to 0.'
        next
      end
      if amount > @balance
        puts "Amount must be less than or equal to the current balance (#{@balance})."
        next
      end

      @balance -= amount
      show_balance
      break
    end
  end

  def show_balance
    puts "Balance: #{@balance}"
  end

  def init
    load_balance
    puts "Choose action:
\tD - Deposit
\tW - Withdraw
\tB - Balance
\tQ - Quit"

    loop do
      print 'Action [D/W/B/Q]: '
      action = gets.chomp.upcase

      case action
      when 'D'
        deposit
      when 'W'
        withdraw
      when 'B'
        show_balance
      when 'Q'
        save_balance
        break
      end
    end
  end
end
