class ApplicationController < ActionController::Base



protect_from_forgery with: :exception
helper_method :current_user, :logged_in?, :authenticate_user

#kip_before_action :verify_authenticity_token



def add_artist
  # binding.pry
if session[:user_id]    
@user = User.find(session[:user_id])
@artists = @user.added_artists
 @added_artist = Artist.find_by_id(params[:id])
if !@user.added_artists.include?(@added_artist)
@user.added_artists << @added_artist
redirect_to  admin_user_artists_path(@artists)
   else
       redirect_to  admin_user_path
end
end
end

def about

end

  
  def welcome
    if session[:user_id]
    @user = User.find(session[:user_id])
    redirect_to admin_root_path
    artists = Artist.all
    elsif session[:artist_id]
    @artist = Artist.find(session[:artist_id])
    @artists = Artist.all
    else
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
