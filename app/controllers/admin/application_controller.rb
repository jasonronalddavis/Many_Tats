class Admin::ApplicationController < ActionController::Base
#include UserHelper


protect_from_forgery with: :exception
helper_method :current_user, :logged_in?, :authenticate_user


def add_tat_artist
  # binding.pry
if session[:user_id]    
@user = User.find(session[:user_id])
@artists = Artist.all
 @added_artist = Artist.find_by_id(@tat.artist_id)
if !@user.added_artists.include?(@added_artist)
@user.added_artists << @added_artist
end
end
end


  
  
  def welcome
    if session[:user_id] != nil
      @user = User.find(session[:user_id])
    elsif session[:artist_id] != nil
      @artist = Artist.find(session[:artist_id]) 
    end
      @artists = Artist.all
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

  def destroy
    sessions.clear
    redirect_to root_path
  end

  def authenticate_user
     redirect_to root_path unless logged_in?
  end
  
  

end
