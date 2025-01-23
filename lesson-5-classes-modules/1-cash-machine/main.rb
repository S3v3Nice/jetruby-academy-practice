# frozen_string_literal: true

require_relative 'cash_machine'

BALANCE_FILE_NAME = 'balance.txt'

cash_machine = CashMachine.new(BALANCE_FILE_NAME)
cash_machine.init
