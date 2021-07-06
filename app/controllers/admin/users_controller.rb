class Admin::UsersController < Admin::ApplicationController


    def new
     #binding.pry
     @user = User.new
    end

    def create

        @user = User.new(user_params)
        @user && @user.authenticate(user_params)    
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to admin_user_path(@user)
        else
            redirect_to admin_root_path
        end
    end

    def show
       current_user
       @user = User.find(session[:user_id])
        @tats = @user.tats
        @artists = @user.artists
        # binding.pry
        # if current_user.admin == false
        #     if current_user != @user
        #         redirect_to root_path
        #     end
        # end
    end

    def destroy 
        session.delete 
          redirect_to admin_root_path    
      end


    # def destroy
    #     @user = User.find(params[:id])
    #     @user.destroy
    #     redirect_to root_path
    # end

    private

    def user_params 
        params.require(:user).permit( :id,:name, :password)
    end



end 
