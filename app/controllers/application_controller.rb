class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
<<<<<<< HEAD

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	helper_method :current_user
=======
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
 
  helper_method :current_user
>>>>>>> 2d3300c8c0c2cd756f25428c40a0a8e1f8ab39e3
end
