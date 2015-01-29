require 'rspec'
require 'rack/test'
require 'capybara/rspec'
require_relative '../app'
require_relative 'support/features/app_helpers'

set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
  App.set(session_secret: 'test string')
end

Capybara.app = app

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Capybara::DSL
  config.include Features::AppHelpers

  config.before :context do
    NVTT::Database.seed
  end

  config.after :context do
    NVTT::Database.seed
  end
end

