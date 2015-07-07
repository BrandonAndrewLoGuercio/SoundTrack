class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password,
    #                                                         :password_confirmation, :remember_me, :avatar, :avatar_cache, :avatar_url, :remote_avatar_url) }
    # devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    #
    # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password,
    #                                                                :password_confirmation, :current_password, :avatar, :avatar_cache, :avatar_url, :remote_avatar_url) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache, :avatar_url, :remote_avatar_url, :headline) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me, :headline) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password,:avatar, :avatar_cache, :avatar_url, :remote_avatar_url, :remove_avatar, :headline) }
  end
end
