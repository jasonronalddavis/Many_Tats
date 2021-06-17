class Admin::SessionsController < ApplicationController
  
  helper_method :Artist?
  
  
  
  
  
  
  def new

    if !logged_in?
    @artist = Artist.new
    @user = User.new
    render :new
    else
      redirect_to root_path
    end
end

def create
    @user = User.find_or_create_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:password])    
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else
        render :new
    end
  end

  def destroy 
    session.delete :user_id
        redirect_to root_path    
  end
end
