class LikesController < ApplicationController
  before_action :authenticate_user!

  def create_likes
    @post = Post.find(params[:id])
    @like = Like.new(user: current_user, likeable: @post)

    if @like.save
      flash[:notice] = 'Post liked!'
    else
      flash[:alert] = 'Failed to like the post.'
    end

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find(params[:id])

    if @like.destroy
      flash[:notice] = 'Post unliked!'
    else
      flash[:alert] = 'Failed to unlike the post.'
    end

    redirect_back(fallback_location: root_path)
  end

  def show
    # Add logic for displaying likes if needed
  end
end
