class ApplicationController < ActionController::Base

    before_action :authenticate_admin!

protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate_user




  
  def welcome
   #binding.pry
    @user = User.find(session[:user_id])
    
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
    # will return true if there is a user??
  end

  def authenticate_user
      redirect_to root_path unless logged_in?
  end
  def logout
    session.clear
    redirect_to  root_path
  end

end