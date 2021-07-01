class TatsController < ApplicationController
    
  

def new
#binding.pry
@user =  User.find(session[:user_id])
  @tat = @user.tats.build(tat_params) #({user_id: @user.id})  
  @artists = Artist.all

end


   
  def create
  
  @user =  User.find(session[:user_id])
    @tat = @user.tats.find(tat_params)
   if  @tat.save
    redirect_to user_tat_path(@tat)
  else
        render :new
    end
  end


    def index
      @tats = Tat.all
      if current_user.id = [:artist_id]
        @current_user = current_user
      else
        @current_user = current_user
      end
    end
    
def show
  if session[:user_id]
    @artist = Artist.find(params[:artist_id])
    @tats = @artist.tats.all
    @users = @artist.users
    @user = User.find(session[:user_id])
elsif session[:artist_id]
  @tat = Tat.find(params[:id])
  @artist = @tat.artist
  @artist = Artist.find(session[:artist_id])
end
end

def remove_artist 
  @tat = Tat.find(params[:id])
  @artist = Artist.find(session[:artist_id])
  @user = User.find_by_id(@tat.user_id)
  @tat.artist.delete(@tat.artist_id)
  redirect_to admin_artist_path(@artist)
  end

 def edit
 # binding.pry

  @artists = Artist.all
  @tat = Tat.find(params[:id])

end

def update
  @artists = Artist.all
  @tat = @user.tats.build(tat_params)
  if @tat.save
    redirect_to user_tat_path(@tat)
  else
    render :edit
  end
end


def destroy
  @tat = Tat.find(params[:id])
  @tat.destroy
  redirect_to admin_root_path
end


private 
    def tat_params 
      params.require(:tat).permit(:user_id, :artist_id, :style, :name, :description, :color_range)
end

end