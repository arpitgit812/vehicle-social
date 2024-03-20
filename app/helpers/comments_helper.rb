module CommentsHelper
  def comment_count(commentable)
    commentable.comments.count
  end
end
