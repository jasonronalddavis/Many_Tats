module ApplicationHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        @current_artist ||= Artist.find_by(id: session[:artist_id]) if session[:artist_id]
      end
    
      def logged_in?
        !!current_user
        # will return true if there is a user??
      end
    
      def authenticate_user
          redirect_to root_path unless logged_in?
      end
end
