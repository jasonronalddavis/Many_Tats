class Admin::UsersController < Admin::ApplicationController
    
    def new
     #binding.pry
     @user = User.new
    end


    def create
        @user = User.new(user_params)
        @user && @user.authenticate(user_params)  
        if  @user.valid?  
       @user.save
        session[:user_id] = @user.id
         redirect_to admin_user_path(@user)
        else
            render :new
    end
end
 
  

    def show
       @user = User.find(session[:user_id])
        @tats = @user.tats
        @artists = @user.artists
    end

    def destroy 
        session.delete 
          redirect_to admin_root_path    
      end


      def update
        @user = User.find(params[:id])
        if @user.valid?
        @user.update(user_params)
        redirect_to admin_user_path(@user)
        else
            render :new
    end
end

    private

    def user_params 
        params.require(:user).permit( :id, :name, :email, :password, :provider, :uid, :artist_id)
    end



end 
