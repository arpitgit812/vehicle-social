class PagesController < ApplicationController
  def home
    @latest_posts = Post.latest(10)
  end
end

# in the Post model
class Post < ApplicationRecord
  def self.latest(n)
    order(created_at: :desc).limit(n)
  end
end

