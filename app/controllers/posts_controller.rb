# app/controllers/posts_controller.rb

class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create

    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post created successfully.'
    else
      render 'new'
    end
  end

  def edit
    # Ensure that the user trying to edit is the owner of the post
    if @post.user == current_user
      render :edit
    else
      redirect_to posts_path, alert: 'You are not authorized to edit this post.'
    end
  end

  def destroy
    # Ensure that the user trying to delete is the owner of the post
    if @post.user == current_user
      @post.destroy
      redirect_to posts_path, notice: 'Post deleted successfully.'
    else
      redirect_to posts_path, alert: 'You are not authorized to delete this post.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
