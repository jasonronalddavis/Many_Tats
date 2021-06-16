class TatsController < ApplicationController
    
  

def new
#binding.pry
  @user = current_user
  @tat = @user.tats.build #({user_id: @user.id})  
  @artists = Artist.all

end


   
  def create
  
    @user = User.find(session[:user_id])
    @tat = @user.tats.build(tat_params)
   if  @tat.save
    redirect_to user_tat_path(@tat)
  else
        rednder :new
    end
  end


    def index
      if params[:artist_id]
        @artist = Artist.find(params[:artist_id])
        @tats = @artist.tats.all
        @users = @artist.users
      else
      #  binding.pry
      @user = User.find(session[:user_id])
      @tats = @user.tats
      @artists = @user.artists
      end
    end
    
def show
  @tat = Tat.find(params[:id])
  @user = User.find_by(id: params[:id])

end



 def edit
  @user = current_user
  @artists = Artist.all
  @tat = Tat.find(params[:id])
end

def update
  @user = current_user
  @tat = @user.tats.build(tat_params)
  if @tat.save
    redirect_to user_tat_path(@tat)
  else
    render :edit
  end
end


  
  def destroy
    sessions.clear
    redirect_to application_path
  end

private 
    def tat_params 
     # binding.pry
      params.require(:tat).permit(:user_id, :artist_id, :style, :name, :description, :color_range)
end

end