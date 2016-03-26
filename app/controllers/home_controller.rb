class HomeController < ApplicationController
	skip_before_action :require_login
	before_action :skip_if_logged_in
	
  def index
  end
end
