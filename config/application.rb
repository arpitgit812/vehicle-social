# Require the boot file to setup the load paths
require_relative "boot"

# Include all Rails components
require "rails/all"

# Require the gems listed in Gemfile, depending on the environment
Bundler.require(*Rails.groups)

# Define the main application module
module VehicleSocialApp
  # Define the Rails application class
  class Application < Rails::Application
    # Initialize configuration defaults for the original Rails version
    config.load_defaults 7.0

    # Set the application time zone
    config.time_zone = 'Eastern Time (US & Canada)'

    # Configure the assets pipeline
    config.assets.enabled = true
    config.assets.version = '1.0'

    # Configure the log level
    config.log_level = :debug

    # Configure the secret key base
    config.secret_key_base = ENV['VEHICLE_SOCIAL_APP_SECRET_KEY_BASE']

    # Configuration for the application, engines, and railties goes here.
    # These settings can be overridden in specific environments.

    # config.eager_load_paths << Rails.root.join("extras")
  end
end
