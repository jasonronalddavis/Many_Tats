class TatsController < ApplicationController
    
  

def new
#binding.pry
  @user = current_user
  @tat = @user.tats.new(tat_params)  
  @artists = Artist.all

end


   
  def create
   #binding.pry
    @user = User.find(session[:user_id])
    @tat = @user.tats.build(tat_params)
    @artists = Artist.all
        redirect_to user_path(current_user)
    end


    def index
      if params[:artist_id]
        @tats = Artist.find(params[:artist_id]).tats
      else
        @tats = Tat.all
      end
    end
    


  def show
    @user = User.find_by(id: params[:id])
    @tat = @user.tat.find(params[:id])
  end
  


  
  def destroy
    sessions.clear
    redirect_to application_path
  end

private 
    def tat_params 
      binding.pry
      params.permit( :user_id, :artist_id, :name, :description)
end

end