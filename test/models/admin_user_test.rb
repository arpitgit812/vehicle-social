require "test_helper"

class AdminUserTest < ActiveSupport::TestCase
  test "creation of an admin user" do
    admin = AdminUser.new(email: "admin@example.com", password: "password", password_confirmation: "password", is_admin: true)
    assert admin.save
  end
end
