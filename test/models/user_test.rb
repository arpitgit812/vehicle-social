require "test_helper"

class UserTest < ActiveSupport::TestCase
  # Test for valid user creation
  test "user should be valid" do
    user = User.new(name: "John Doe", email: "john@example.com", password: "password")
    assert user.valid?
  end

  # Test for invalid user creation without a name
  test "user should not be valid without a name" do
    user = User.new(email: "john@example.com", password: "password")
    refute user.valid?
  end

  # Test for invalid user creation without an email
  test "user should not be valid without an email" do
    user = User.new(name: "John Doe", password: "password")
    refute user.valid?
  end

  # Test for invalid user creation without a password
  test "user should not be valid without a password" do
    user = User.new(name: "John Doe", email: "john@example.com")
    refute user.valid?
  end
end
