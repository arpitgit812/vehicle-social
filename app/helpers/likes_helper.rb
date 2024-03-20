module LikesHelper
  # Returns the HTML for a link to like a given object
  def like_link(object)
    like = Like.find_by(user: current_user, likeable: object)
    if like
      link_to "Unlike", like_path(like), method: :delete
    else
      link_to "Like", like_path(object), method: :post
    end
  end

  # Returns the number of likes for a given object
  def like_count(object)
    object.likes.size
  end
end

