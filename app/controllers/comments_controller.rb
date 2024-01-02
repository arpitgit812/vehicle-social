class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:index]
    def index
        @comments = @post.comments
    end 

    def create
      @commentable = find_commentable
      @comment = @commentable.comments.build(comment_params)
      @comment.user = current_user
  
      if @comment.save
        flash[:notice] = 'Comment created!'
      else
        flash[:alert] = 'Failed to create comment.'
      end
  
      redirect_to root_path 
    end
  
    def new
        @commentable = find_commentable
        @comment = Comment.new      
    end
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  
    def find_commentable
      if params[:post_id]
        Post.find(params[:post_id])
      end
      # Add more conditions for other commentable types if needed
    end
    def set_post
        @post = Post.find(params[:post_id])
    end 
  end