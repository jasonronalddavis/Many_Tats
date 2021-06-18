class SessionsController < ApplicationController
  
  helper_method :Artist?
  
  
  
  
  
  
  def new

    if !logged_in?
    @artist = Artist.new
    @user = User.new
    render :new
    else
      redirect_to root_path
    end
end

def create
  if session[:user_id]
    @user = User.find_or_create_by(name: params[:user][:name])
     @user && @user.authenticate(params[:password])    
        session[:user_id] = @user.id
        redirect_to admin_user_path(@user) 
  elsif session[:artist_id]
    @artist = Artist.find_or_create_by(name: params[:artist][:name])
    @artist && @artist.authenticate(params[:password])    
       session[:artist_id] = @artist.id
       redirect_to admin_artist_path(@artist)
      else
        render :new
    end
  end

  def destroy 
    session.delete :user_id
        redirect_to root_path    
  end
end
