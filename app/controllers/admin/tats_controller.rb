class Admin::TatsController < ApplicationController
 
helper_method :validate?


  

def new
    # raise params.inspect
     @user = User.find(session[:user_id])
     @tat = @user.tats.build
      @artists = Artist.all
    end
    
    
       
      def create
        @artists = Artist.all
        @user = User.find(session[:user_id])
        @tat = @user.tats.build(tat_params)
        @artist = @tat.artist
       if  @tat.valid?
        @tat.save
        if @tat.artist != nil
        add_artist
      end
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
          if session[:artist_id]
            @artist = Artist.find(session[:artist_id])
            @tats = @artist.tats
            @users = @artist.users
          elsif session[:user_id]
          @user = User.find(session[:user_id])
          @tats = @user.tats
          @artists = @user.artists
          end
        end
        
    def show
     # binding.pry
      if session[:user_id]
        @user = User.find(session[:user_id])
        @tat = Tat.find(params[:id]) 
       @tat_artist = @tat.artist
    end
     if session[:artist_id]
     # binding.pry
     @artist = Artist.find(session[:artist_id])
     @tat = Tat.find(params[:id]) 
  end
end

    
    def remove_artist 
   # binding.pry
    @artist = Artist.find(session[:artist_id])
    @tat = Tat.find(params[:id])
   @tat.artist = nil 
   @tat.save
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
     
      @artists = Artist.all
      if session[:user_id]
      @tat = Tat.find(params[:id])
      @user = User.find(session[:user_id])
      if @tat.user == @user
      if @tat.valid?
        @tat.update(tat_params)
        redirect_to admin_user_tat_path(@tat)
      elsif session[:artist_id]
        @artist = Artist.find(session[:artist_id])
        redirect_to admin_artist_tat_path(@tat)
      else
        render :edit
    end
  end
end
end



    def destroy
      @tat = Tat.find(params[:id])
      @tat.destroy
      redirect_to admin_root_path
    end

  def approve_tat
   # binding.pry
    @tat = Tat.find(params[:id])
    if params[:tat][:stat] == "true"
      @tat.stat = true
    elsif params[:tat][:stat] == "false"
      @tat.stat = false
    end
    @tat.save
    redirect_to admin_root_path
  end

    
    
      def tat_params 
       #raise params.inspect
      params.require(:tat).permit(:id, :appointment_date,:approve, :stat, :user_id, :artist_id, :style, :name, :description, :color_range, :status)
    end

    end