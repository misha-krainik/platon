ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../dummy/config/environment.rb', __FILE__)

require 'pry'

require 'rspec/rails'

require 'dotenv'
Dotenv.load(".env.#{ENV['RAILS_ENV']}")

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'platon'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

Dir[File.join(ENGINE_RAILS_ROOT, 'spec/support/**/*.rb')].each {|f| require f }

Platon::Configure.cfg do |cfg|
  cfg.account_key = SecureRandom.hex
  cfg.account_password = SecureRandom.hex
  cfg.pay_url = 'https://secure.platononline.com/payment/auth'
  cfg.callback_url = '/success_url'
  cfg.error_url = '/error.url'
  cfg.payment_method = 'CC'
end

RSpec.configure do |config|
  config.use_transactional_fixtures = true
end
