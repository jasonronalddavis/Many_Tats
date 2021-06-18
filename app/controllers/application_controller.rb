class ApplicationController < ActionController::Base



protect_from_forgery with: :exception
helper_method :current_user, :logged_in?, :authenticate_user




  
  def welcome
    if logged_in? && session[:user_id]
    @user = User.find(session[:user_id])
    redirect_to admin_root_path
    artists = Artist.all
    else
    @artist = Artist.find(session[:artist_id])
    @artists = Artist.all
    redirect_to admin_root_path
  end
  end

  

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    @current_artist ||= Artist.find_by(id: session[:artist_id]) if session[:artist_id]
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
