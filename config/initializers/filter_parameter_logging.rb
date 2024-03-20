# Be sure to restart your server when you modify this file.

# Configure parameters to be filtered from the log file. Use this to limit dissemination of
# sensitive information. See the ActiveSupport::ParameterFilter documentation for supported
# notations and behaviors.
Rails.application.config.filter_parameters += [
  /passw\w*/, /secret\w*/, /token\w*/, /_key\w*/, /crypt\w*/, /salt\w*/, /certificate\w*/, /otp\w*/, /ssn\d{3}-\d{2}-\d{4}/
]

