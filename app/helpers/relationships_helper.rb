module RelationshipsHelper
  def following?(current_user, user)
    current_user.active_relationships.find_by(followed_id: user.id)
  end

  def follow_button(current_user, user)
    if following?(current_user, user)
      button_to 'Unfollow', relationship_path(current_user.active_relationships.find_by(followed_id: user.id)), method: :delete, class: 'btn btn-danger'
    else
      button_to 'Follow', relationships_path(followed_id: user.id), class: 'btn btn-primary'
    end
  end
end
