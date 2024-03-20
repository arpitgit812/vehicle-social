ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # Helper method to cleanup database transactions after each test
  def teardown
    DatabaseCleaner.clean
  end

  # Helper method to setup database transactions before each test
  def setup
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end
end
