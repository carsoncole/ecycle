ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start 'rails'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  include FactoryBot::Syntax::Methods

  setup do
    settings = create(:setting)
  end

  def app_settings
    Setting.last
  end

  def sign_in(user)
    post session_path \
      'session[email]'    => user.email,
      'session[password]' => user.password
  end  
end
