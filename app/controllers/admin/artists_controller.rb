class Admin::ArtistsController < Admin::ApplicationController
    def new
        @artist = Artist.new
    end

    

    def create
    #  binding.pry
 
    @artist = Artist.new(artist_params)
    @artist && @artist.authenticate(artist_params)   
    if @artist.valid?
          @artist.save
            session[:artist_id] = @artist.id
            redirect_to admin_artist_path(@artist)
        else
            render :new
        end
    end




    def index
     # binding.pry
        if session[:user_id]
        @user = User.find(session[:user_id])
        @artists = @user.x
        #@artist = user_artists.find_by_id(artist_id)
        elsif session[:artist_id]
            @artist = Artist.find(session[:artist_id])
            @artists = Artist.all
        end        
    end

    def show
        if session[:user_id]
        @user = current_user
        elsif session[:artist_id]
        @artist = Artist.find(session[:artist_id])
       # @user = @artist.users.find(params[:user_id])
        @artist_tats = @artist.tats
      # @user_tats = @user.tats
    end
end





    def edit
        @artist = Artist.find(params[:id])
    end

    def update
        @artist = Artist.find(params[:id])
        if @artist.valid?
        @artist.update(artist_params)
        redirect_to admin_artist_path(@artist)
        else
            render :new
    end
end


    private

   

    def destroy
        sessions.clear
        redirect_to root_path
      end

def artist_params
    params.require(:artist).permit( :id, :name, :password, :bio, :user_id)
    end

end