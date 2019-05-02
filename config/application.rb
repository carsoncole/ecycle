require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bainbridgeecycle
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.time_zone = 'Pacific Time (US & Canada)'
    config.action_mailer.default_url_options = { host: 'gmail.com' }
    config.active_job.queue_adapter = :sucker_punch

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true
  end
end