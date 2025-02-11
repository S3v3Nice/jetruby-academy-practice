# frozen_string_literal: true

require 'rack'
require_relative 'cash_machine'

class CashMachineApp
  BALANCE_FILE_NAME = 'balance.txt'

  def initialize
    @cash_machine = CashMachine.new(BALANCE_FILE_NAME)
  end

  def call(env)
    request = Rack::Request.new(env)
    case request.path
    when '/deposit'
      handle_deposit(request)
    when '/withdraw'
      handle_withdraw(request)
    when '/balance'
      handle_balance
    else
      response(404, 'Not found')
    end
  end

  private

  def handle_deposit(request)
    value = request.params['value']&.to_f

    unless value
      return response(400, 'Missing required query parameter \'value\'')
    end

    if value.negative?
      return response(400, 'Value must be greater than 0')
    end

    @cash_machine.deposit value
    response(200, "Deposited #{value}. Current balance: #{@cash_machine.balance}")
  end

  def handle_withdraw(request)
    value = request.params['value']&.to_f

    return response(400, 'Missing required query parameter \'value\'') unless value
    return response(400, 'Value must be greater than 0') if value.negative?

    if value > @cash_machine.balance
      return response(400, "Value is greater than current balance (#{@cash_machine.balance})")
    end

    @cash_machine.withdraw value
    response(200, "Withdrawn #{value}. Current balance: #{@cash_machine.balance}")
  end

  def handle_balance
    balance = @cash_machine.balance
    response(200, "Current balance: #{balance}")
  end

  def response(status, text)
    [status, { 'Content-Type' => 'text/plain' }, [text]]
  end
end
