# frozen_string_literal: true

class CreateAdminUsersTable < ActiveRecord::Migration[7.0]
  # This migration creates the admin_users table for storing administrator accounts.

  def change
    create_table :admin_users do |t|
      # Database Authenticatable
      t.string :email, null: false, default: "" # The user's email address.
      t.string :encrypted_password, null: false, default: "" # The user's encrypted password.

      # Recoverable
      t.string :reset_password_token # A token for resetting the user's password.
      t.datetime :reset_password_sent_at # The timestamp when the reset password token was sent.

      # Rememberable
      t.datetime :remember_created_at # The timestamp when the user's remember token was created.

      # Trackable (commented out by default)
      # t.integer :sign_in_count, default: 0, null: false # The number of times the user has signed in.
      # t.datetime :current_sign_in_at # The timestamp when the user last signed in.
      # t.datetime :last_sign_in_at # The timestamp when the user last signed in before the current sign-in.
      # t.string :current_sign_in_ip # The IP address of the user's current sign-in.
      # t.string :last_sign_in_ip # The IP address of the user's last sign-in before the current sign-in.

      # Confirmable (commented out by default)
      # t.string :confirmation_token # A token for confirming the user's account.
      # t.datetime :confirmed_at # The timestamp when the user's account was confirmed.
      # t.datetime :confirmation_sent_at # The timestamp when the confirmation token was sent.
      # t.string :unconfirmed_email # The user's unconfirmed email address (only used if reconfirmable).

      # Lockable (commented out by default)
      # t.integer :failed_attempts, default: 0, null: false # The number of failed sign-in attempts.
      # t.string :unlock_token # A token for unlocking the user's account.
      # t.
