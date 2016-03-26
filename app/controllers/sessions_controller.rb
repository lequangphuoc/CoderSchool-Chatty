class SessionsController < ApplicationController
	skip_before_action :require_login, only: [:new, :create]
  before_action :skip_if_logged_in, only: [:new, :create]
	
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
    	session[:user_id] = user.id
      #user.update(current_sign_in_at:)
      redirect_to messages_path
    else
      	flash.now[:error] = 'Invalid email/password combination'
      	render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out."
    redirect_to root_path
  end
end
