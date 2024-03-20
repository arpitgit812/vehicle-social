# app/controllers/posts_controller.rb

class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # Improvement: Use `@posts` variable only when it's an index action
  def index
    @posts = policy_scope(Post)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post created successfully.'
    else
      render 'new'
    end
  end

  def edit
    authorize @post
  end

  def destroy
    authorize @post

    if @post.destroy
      redirect_to posts_path, notice: 'Post deleted successfully.'
    else
      redirect_to posts_path, alert: 'You are not authorized to delete this post.'
    end
  end

  def share
    @post = Post.find(params[:id])
    current_user.shares.create(post: @post)
    @post.increment!(:share_count)
    redirect_to @post, notice: 'Post shared!'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

  # Add authorization using Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    redirect_to posts_path, alert: 'You are not authorized to perform this action.'
  end
end
