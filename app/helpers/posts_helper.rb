module PostsHelper
  def sticky?(post)
    post.sticky?
  end
end


class Post < ApplicationRecord
  def sticky?
    self.sticky == true
  end
end
