class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  helper_method :current_user, :signed_in?

  def current_user
  	@current_user ||= User.find_by_id session[:user_id]
  end

  def signed_in?
  	current_user != nil
  end

  def require_login
    unless signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path
    end
  end

  def skip_if_logged_in
  	redirect_to messages_path if signed_in?
  end
end
