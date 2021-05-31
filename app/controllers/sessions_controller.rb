class SessionsController < ApplicationController
  def new
    if !logged_in?
    @user = User.new
    else
      redirect_to toot_path
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


private

def auth
  @user = User.find_or_create_by(user_id: request.env['omniauth.auth'][:user_id], provider: request.env['omniauth.auth'][:provider]) do |u|
  u.username = request.env['omniauth.auth'][:info][:first_name]
  u.email = request.env['omniauth.auth'][:info][:email]
  u.password = SecureRandom.hex(15)
end
if user.valid?
sessions[:user_id] = @user.id
redirect_to root_path
else
  redirect_to login_path
end
end


def destroy
    # binding.pry
    session.delete :user_id
    redirect_to root_path
end

end

end