class UsersController < ApplicationController
	skip_before_action :require_login, only: [:new, :create]
	before_action :skip_if_logged_in, only: [:new, :create]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'You signed up successfully'
      redirect_to messages_path
    else
    	flash.now[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
