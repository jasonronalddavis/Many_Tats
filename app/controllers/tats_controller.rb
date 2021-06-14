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
    @tat.save
    
        redirect_to user_tat_path(@user, @tat)
    end


    def index
      if params[:artist_id]
        @tats = Artist.find(params[:artist_id]).tats
      else
        @tats = Tat.all
      end
    end
    
def show
  @tat = Tat.find(params[:id])
  @user = User.find_by(id: params[:id])

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