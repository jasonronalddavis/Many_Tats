class Admin::TatsController < ApplicationController
  def new
    # raise params.inspect
     @user = User.find(session[:user_id])
     @tat = @user.tats.build
      @artists = Artist.all
    end
    
    
       
      def create
    
        @user = User.find(session[:user_id])
        @tat = @user.tats.build(tat_params)
        @artist = @tat.artist
       if  @tat.save
        add_artist
        @user.artists << @artist 
        redirect_to admin_user_tat_path(@user,@tat)
      else
            render :new
        end
      end
    
      def add_artist
        @user = User.find(session[:user_id])
        @artist = Artist.find_by_id(@tat.artist_id)
        @user.artists << @artist 
    end
    
    
    
    
        def index
          if params[:artist_id]
            @artist = Artist.find(session[:artist_id])
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
      if session[:user_id]
        @user = User.find(session[:user_id])
        @tat = Tat.find(params[:id])
      if @tat.artist != nil
        @artist = @tat.artist
        @user = @tat.user
      else 
        @artist = Artist.find_by_id(params[:artist_id])
      end
    end
     if session[:artist_id]
     @artist = Artist.find(session[:artist_id])
     @tat = Tat.find(params[:id]) 
  end
end

    
    def remove_artist 
    #  binding.pry
    @artist = Artist.find(session[:artist_id])
    @tat = Tat.find(params[:id])
    @tat.delete(artist_id)
    redirect_to admin_artist_path(@artist)
    end
    
    
    
    
     def edit
      @artists = Artist.all
      @user = User.find(session[:user_id])
      @tat = Tat.find(params[:id])
      if @tat.artist != nil
      @artist = Artist.find_by_id(@tat.artist_id)
      @users = @artist.users
      else
        @artist = Artist.find_by_id(params[:artist_id])
    end
  end
    
    def update
      
      @tat = Tat.find(params[:id])
      @tat.update(tat_params)
      if @tat.update(tat_params)
        redirect_to admin_user_tat_path(@tat)
      else
        render :edit
      end
    end
    
    
      
    def destroy
      @tat = Tat.find(params[:id])
      @tat.destroy
      redirect_to admin_root_path
    end
    
    
    
      def tat_params 
       #raise params.inspect
      params.require(:tat).permit(:id, :user_id, :artist_id, :style, :name, :description, :color_range)
    end
    
    end