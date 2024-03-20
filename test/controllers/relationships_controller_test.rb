require "test_helper"

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:michael)
    @other_user = users(:archer)
    sign_in @user
  end

  test "should follow a user" do
    assert_difference "@user.following.count", 1 do
      post relationships_path, params: { followed_id: @other_user.id }
    end
    assert_redirected_to @other_user
  end

  test "should unfollow a user" do
    @user.follow(@other_user)
    relationship = @user.active_relationships.find_by(followed_id: @other_user.id)
    assert_difference "@user.following.count", -1 do
      delete relationship_path(relationship)
    end
    assert_redirected_to @other_user
  end
end

