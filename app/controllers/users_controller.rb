class UsersController < ApplicationController

    def new
     #binding.pry
     @user = User.new(user_params)
    end

    def create
     
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to admin_user_path(@user)
        else
            render :new
        end
    end

    def index
        @users = User.all
        @artists = User.all
        if session[:artist_id]
            @artist = Artist.find(session[:artist_id])
        elsif session[:user_id]
        @user = User.find(session[:user_id])
          end
    end

    def show
    if session[:user_id]
    @current_user = User.find(session[:user_id])
    @user = User.find(params[:id])
    elsif session[:artist_id]
    @artist = Artist.find(session[:artist_id])
    @user = User.find(params[:id])
end
end



def add_user
    if session[:user_id]
    @user = User.find(session[:user_id])
    @artist = Artist.find(params[:id])
    @user.artists << @artist 
    elsif session[:artist_id]
        @artist = Artist.find(session[:artist_id])
        @user = User.find(params[:id])
        @artist.users << @user
    end
    redirect_to admin_artist_path(@artist)
end

    private

    def user_params
        
        params.require(:user).permit( :id, :name, :password, :provider, :uid, :artist_id)
    end



end 
