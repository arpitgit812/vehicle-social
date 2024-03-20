class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params.permit(:followed_id).values.first)
    current_user.follow(@user)
    redirect_to @user
  end

  def destroy
    @user = Follow.find(params[:id]).followed
    current_user.unfollow(@user)
    redirect_to @user
  end
end
