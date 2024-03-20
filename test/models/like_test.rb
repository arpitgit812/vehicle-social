require "test_helper"

class LikeTest < ActiveSupport::TestCase
  def setup
    @like = likes(:one) # assuming you have a fixture set up for Like model
  end

  test "like should belong to a user" do
    assert @like.user
  end

  test "like should belong to a post" do
    assert @like.post
  end
end
