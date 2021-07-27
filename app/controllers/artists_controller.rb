class ArtistsController < ApplicationController
  
    helper_method :add_artist
    
    
    
    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(artist_params)
        if @artist.save
            session[:artist_id] = @artist.id
            redirect_to admin_artist_path(@artist)
        else
            render :new
        end
    end



    def index
        @artists = Artist.all
        if session[:artist_id]
            @artist = Artist.find(session[:artist_id])
            @tats = @artist.tats.all
            @users = @artist.users
        elsif session[:user_id]
        @user = User.find(session[:user_id])
        @artist = Artist.find_by(id: params[:id])
          @tats = @user.tats.all
          end
    end

    def show

  if session[:user_id]
    @user = User.find(session[:user_id])
    @artist = Artist.find(params[:id])
    elsif session[:artist_id]
    @artist = Artist.find(session[:artist_id])
    @user = User.find(params[:id])
   @user_artist = Artist.find(params[:id])
  # @user_tats = @user.tats
end
end 



def add_artist
    if session[:user_id]
    @user = User.find(session[:user_id])
    @artist = Artist.find(params[:id])
    @user.artists << @artist
    elsif session[:artist_id]
        @artist = Artist.find(session[:artist_id])
        @user_artist = Artist.find(params[:id])
        @artist.artists << @artist 
    end
    redirect_to admin_artists_path
end

   

    def edit
        @artist = Artist.find(params[:id])
    end

    def update
        @artist = Artist.find(params[:id])
        @artist.update(artist_params)
        redirect_to artist_path(@artist)
    end


    private

def destroy
end

def artist_params 
    params.require(:artist).permit( :id, :name, :password, :bio, :user_id)
    end

   
end
