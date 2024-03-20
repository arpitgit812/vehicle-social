# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize! do |app|
  # Configure the application's environment.
  app.config.load_defaults 6.1

  # Configure the database.
  app.config.database_configuration = YAML.load_file(Rails.root.join("config", "database.yml"))[Rails.env]

  # Load the database if in the development environment.
  if Rails.env.development?
    app.config.database_configuration['logging'] = true if app.config.database_configuration['adapter'] == 'postgresql'
    app.config.database_configuration['wait_timeout'] = 5
    ActiveRecord::Base.establish_connection(app.config.database_configuration)
    ActiveRecord::Base.connection.execute("CREATE EXTENSION IF NOT EXISTS pg_trgm")
  end
end
