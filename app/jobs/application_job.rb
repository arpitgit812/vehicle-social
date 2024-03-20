# Specify the module name explicitly to avoid any potential naming conflicts
module MyApp
  class ApplicationJob < ActiveJob::Base
    # Use a constant for the number of retries, to make it easier to modify in the future
    RETry_COUNT = 3

    # Set up retry behavior with a block that defines when a job should be retried
    retry_on(ActiveRecord::Deadlocked) do |exception, job|
      # Retry the job up to the specified number of times if it was deadlocked
      job.retry_count < RETry_COUNT
    end

    # Define custom retry delay behavior with a block that returns the number of seconds to wait before retrying
    retry_delay(calculator: ->(exception, job) { [1.minute, 5.minutes, 15.minutes][job.retry_count - 1] || 1.minute })

    # Set up discard behavior with a block that defines when a job should be discarded
    discard_on(ActiveJob::DeserializationError) do |exception, job|
      # Discard the job if it cannot be deserialised
      true
    end

    # Add a method to log the start and end of the job, for debugging purposes
    def perform(*args)
      Rails.logger.info("Performing job #{self.class} with args #{args}")
      super(*args)
      Rails.logger.info("Finished job #{self.class} with args #{args}")
    end
  end
end
