# frozen_string_literal: true

Devise.setup do |config|
  # The secret key used by Devise for generating random tokens.
  # Devise uses the `secret_key_base` by default.
  # config.secret_key = 'your_secret_key'

  # Configure the parent class for Devise controllers.
  # config.parent_controller = 'DeviseController'

  # Configure the e-mail address which will be shown in Devise::Mailer.
  config.mailer_sender = 'your_email_address'

  # Configure the ORM. Supports :active_record (default) and :mongoid.
  require 'devise/orm/active_record'

  # Configure which keys are used for authentication.
  config.authentication_keys = [:email]

  # Configure which authentication keys should be case-insensitive.
  config.case_insensitive_keys = [:email]

  # Configure which authentication keys should have whitespace stripped.
  config.strip_whitespace_keys = [:email]

  # Configure if authentication through request.params is enabled.
  config.params_authenticatable = true

  # Configure if authentication through HTTP Auth is enabled.
  config.http_authenticatable = false

  # If 401 status code should be returned for AJAX requests.
  config.http_authenticatable_on_xhr = true

  # The realm used in Http Basic Authentication.
  config.http_authentication_realm = 'Application'

  # If changing the e-mail address should require confirmation.
  config.reconfirmable = true

  # The time the user will be remembered without asking for credentials again.
  config.remember_for = 2.weeks

  # Invalidates all the remember me tokens when the user signs out.
  config.expire_all_remember_me_on_sign_out = true

  # Range for password length.
  config.password_length = 6..128

  # The time you want to timeout the user session without activity.
  config.timeout_in = 30.minutes

  # Defines which strategy will be used to lock an account.
  config.lock_strategy = :failed_attempts

  # Number of authentication tries before locking an account if lock_strategy
  # is failed attempts.
  config.maximum_attempts = 20

  # Time interval you can reset your password with a reset password key.
  config.reset_password_within = 6.hours

  # When set to false, does not sign a user in automatically after their password is
  # reset. Defaults to true, so a user is signed in automatically after a reset.
  config.sign_in_after_reset_password = true

  # The default HTTP method used to sign out a resource.
  config.sign_out_via = :delete
end
