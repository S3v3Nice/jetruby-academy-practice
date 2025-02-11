# frozen_string_literal: true

require 'rspec'
require_relative '../cash_machine'
require_relative '../cash_machine_app'
require 'rack/test'

RSpec.describe CashMachineApp do
  include Rack::Test::Methods

  let(:app) { CashMachineApp.new }

  before do
    stub_const 'CashMachineApp::BALANCE_FILE_NAME', 'test_balance.txt'
    File.write(CashMachineApp::BALANCE_FILE_NAME, CashMachine::START_BALANCE)
  end

  after do
    File.delete(CashMachineApp::BALANCE_FILE_NAME) if File.exist?(CashMachineApp::BALANCE_FILE_NAME)
  end

  describe 'GET /deposit' do
    it 'deposits the specified amount and returns the new balance' do
      get '/deposit', value: 50
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Deposited 50.0')
    end

    it 'returns an error for missing value parameter' do
      get '/deposit'
      expect(last_response.status).to eq(400)
      expect(last_response.body).to include("Missing required query parameter 'value'")
    end

    it 'returns an error for negative value' do
      get '/deposit', value: -10
      expect(last_response.status).to eq(400)
      expect(last_response.body).to include('Value must be greater than 0')
    end
  end

  describe 'GET /withdraw' do
    it 'withdraws the specified amount and returns the new balance' do
      get '/withdraw', value: 50
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Withdrawn 50.0')
    end

    it 'returns an error for missing value parameter' do
      get '/withdraw'
      expect(last_response.status).to eq(400)
      expect(last_response.body).to include("Missing required query parameter 'value'")
    end

    it 'returns an error for negative value' do
      get '/withdraw', value: -10
      expect(last_response.status).to eq(400)
      expect(last_response.body).to include('Value must be greater than 0')
    end

    it 'returns an error if value exceeds balance' do
      get '/withdraw', value: 150
      expect(last_response.status).to eq(400)
      expect(last_response.body).to include("Value is greater than current balance")
    end
  end

  describe 'GET /balance' do
    it 'returns the current balance' do
      get '/balance'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Current balance: #{CashMachine::START_BALANCE}")
    end
  end

  describe 'Invalid routes' do
    it 'returns 404 for undefined routes' do
      get '/undefined'
      expect(last_response.status).to eq(404)
      expect(last_response.body).to include('Not found')
    end
  end
end
