module ArtistsHelper


  def add_artist
    # binding.pry
  if session[:user_id]    
 @user = User.find(session[:user_id])
  @artists = @user.added_artists
   @added_artist = Artist.find_by_id(params[:id])
 if !@user.added_artists.include?(@added_artist)
 @user.added_artists << @added_artist
 redirect_to  admin_user_artists_path(@artists)
     else
         redirect_to  admin_user_path
 end
 end
 end

    def to_hash
        self.each { |key, value|}
      end
end
