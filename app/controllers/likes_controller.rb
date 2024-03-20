class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @likeable = find_likeable
    @like = current_user.likes.new(likeable: @likeable)

    if @like.save

