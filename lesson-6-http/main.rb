# frozen_string_literal: true

require_relative 'cash_machine_app'
require_relative 'simple_rack_server'

app = CashMachineApp.new
SimpleRackServer.new(app).start
