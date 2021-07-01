class Admin::SessionsController < Admin::ApplicationController
  
  
  


    def new
   #  binding.pry
 
   @users = User.all
   @artists = Artist.all
@user = User.find_by(session_params)
    @artist = Artist.find_by(session_params) 
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
    # elsif session[:artist_id]
    #   redirect_to admin_artists_create(@artist)
     else
    render :new
    # end
  end

  


   def destroy
    sessions.clear
    redirect_to root_path
  end
   
    
    def session_params 
      # binding.pry
       params.permit(:user_id, :sessions, :artist_id, :id, :password, :name)
   end
  end