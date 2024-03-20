require "test_helper"

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  test "connects with user id in cookies" do
    cookies.signed[:user_id] = 42

    connect

    assert_equal connection.user_id.to_s, "42"
  end

  test "disconnects when user id is not present in cookies" do
    connect

    refute connection.try(:user_id)
  end
end
