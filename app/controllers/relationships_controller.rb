class RelationshipsController < ApplicationController
    before_action :authenticate_user!
  
    # Action for creating a relationship (following a user)
    def create
      @user = User.find(params[:followed_id])
      current_user.follow(@user)
      redirect_to @user, notice: 'You are now following this user.'
    end
  
    # Action for destroying a relationship (unfollowing a user)
    def destroy
      @user = Relationship.find(params[:id]).followed
      current_user.unfollow(@user)
      redirect_to @user, notice: 'You have unfollowed this user.'
    end
end