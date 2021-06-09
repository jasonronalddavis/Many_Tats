class TatsController < ApplicationController
    


def new
  @user = User.find(session[:user_id])
  @tat = @user.tats.new(tat_params)

end


   
  def create
    binding.pry
    @user = User.find(session[:user_id])
    @tat = @user.tats.build(tat_params)
     
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
  


  private
  
  def destroy
    sessions.clear
    redirect_to application_path
  end

    def tat_params
        params.permit(:tat, :user_id, :description, :name, :color_range, :artist_id)
    end
end