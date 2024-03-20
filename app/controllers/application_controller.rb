class ApplicationController < ActionController::Base
  include ActionController::Permitter

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    permittable_params(:sign_up, keys: [:username])
  end
end
