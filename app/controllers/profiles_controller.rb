class ProfilesController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])

    if @user.nil?
      render_not_found
    end
  end

  private

  def render_not_found
    render file: Rails.root.join('public', '404.html'), status: :not_found
  end
end


@user = User.find_by(username: params.fetch(:username) { raise ActionController::ParameterMissing, 'username is missing' })
