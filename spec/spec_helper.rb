# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'afterpay'
require 'webmock/rspec'
require 'json'
require 'coveralls'
require 'faker'
require 'factory_bot'

Coveralls.wear!

WebMock.disable_net_connect!(allow_localhost: true)

Faker::Config.locale = 'en-US'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
