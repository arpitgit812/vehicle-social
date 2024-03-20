require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like = likes(:one) # assuming you have a fixture set up for like with the name :one
  end

  test "should get index" do
    get likes_url
    assert_response :success
  end

  test "should get new" do
    get new_like_url
    assert_response :success
  end

  test "should create like" do
    assert_difference("Like.count") do
      post likes_url, params: { like: { attribute1: value1, attribute2: value2 } } # replace attribute1, value1, attribute2, value2 with actual attributes and values
    end

    assert_redirected_to like_url(Like.last)
  end

  test "should show like" do
    get like_url(@like)
    assert_response :success
  end

  test "should get edit" do
    get edit_like_url(@like)
    assert_response :success
  end

  test "should update like" do
    patch like_url(@like), params: { like: { attribute1: new_value1, attribute2: new_value2 } } # replace attribute1, new\_value1, attribute2, new\_value2 with actual attributes and values
    assert_redirected_to like_url(@like)
  end

  test "should destroy like" do
    assert_difference("Like.count", -1) do
      delete like_url(@like)
    end

    assert_redirected_to likes_url
  end
end
