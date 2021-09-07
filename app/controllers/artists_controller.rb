class ArtistsController < ApplicationController
  
   
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



    def edit
        @artist = Artist.find(params[:id])
    end

    def update
        @artist = Artist.find(params[:id])
        @artist.update(artist_params)
        redirect_to artist_path(@artist)
    end


    private

#     def to_hash
#         @artist = Artist.find(params[:id])
#         @artist.attributes.reject! do |key, value| 
#         @added_artist = key == "password_digest" || key == "bio" || key == "artist_id"
#     end  
#     end
# end


def destroy
end


def artist_params 

    params.require(:artist).permit( :id, :name, :password, :bio, :user_id, :artist)
    end

   
end
