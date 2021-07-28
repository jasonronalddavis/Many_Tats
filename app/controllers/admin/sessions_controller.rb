class Admin::SessionsController < Admin::ApplicationController
  
  
  


    def new
   @users = User.all
   @artists = Artist.all
    @user = User.find_by(session_params)
    @artist = Artist.find_by(session_params) 
  end
  
  def create
    # binding.pry
       if params[:user][:name] != ""
        @user = User.find_by(name: params[:user][:name]) 
        @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id  
      redirect_to admin_user_path(@user)
       elsif params[:artist][:name] != ""
        @artist = Artist.find_by(name: params[:artist][:name])
        @artist && @artist.authenticate(params[:password])
      session[:artist_id] = @artist.id
          redirect_to admin_artist_path(@artist)
      # elsif session[:artist_id]
      #   redirect_to admin_artists_create(@artist)
       else
      render :new
    end
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
       params.permit(:user_id, :sessions, :artist_id, :id, :email, :password, :name)
   end
  end
end