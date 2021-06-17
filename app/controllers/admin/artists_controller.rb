class Admin::ArtistsController < ApplicationController
    def new
        @artist = Artist.new
    end

    def create
 
        @artist = Artist.new(artist_params)
        if @artist.save
            session[:artist_id] = @artist.id
            redirect_to artist_path(@artist)
        else
            render :new
        end
    end



    def index
        @user = User.find(session[:user_id])
        @artists = @user.artists
    end

    def show
        @user = User.find(session[:user_id])
        @artist = Artist.find(params[:id])
        @artist_tats = @artist.tats
        @user_tats = @user.tats
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
    params.require(:artist).permit( :name, :password)
    end

end