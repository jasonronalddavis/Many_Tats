class SessionsController < ApplicationController
  helper_method :Artist?
  
 
  
 
 
  def new
    @users = User.all
    @artists = Artist.all
   end
   
   def create
     @user = User.find_by(name: params[:user][:name])
     @artist = Artist.find_by(name: params[:artist][:name])
     if session[:user_id] 
     if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id  
     redirect_to admin_user_path(@user)
     elsif session[:artist_id] 
       if @artist && @artist.authenticate(params[:password])
         session[:artist_id] = @artist.id 
         redirect_to admin_artist_path(@artist)
      else
     render :new
   end
   
   def omniauth

   end
   


#button_to always maps to post request
#link_to always get

 def destroy
  sessions.clear
  redirect_to root_path
end
 
  
  def session_params 
    # binding.pry
     params.permit(:user_id, :sessions, :artist_id, :id, :password, :name)
 end
end
end
  
