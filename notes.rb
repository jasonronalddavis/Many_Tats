<h1>Log In</h1>

<%= form_tag "/signin", method: :post do %>
    <%= label_tag :name %>
    <%= collection_select :user, :name, User.all, :name, :name %>
    <br>
    <%= label_tag :password %>
    <%= password_field_tag :password %>
    <br>
    <%= submit_tag "Sign In" %>
<% end %>

shared functionality:
App is divided by two experiences, Artist and User.
User/Artist should be able to sign up, sign in and logout.
User/Artist have attributes [:name, :bio, :user/artist_id]
User/Artist interact with a TAT model.
User/Artist can decline Tat request.
User/Artist can view all Users/Artists
User/Artist can add Artist/User to collection.
User/Artist can edit name and bio
User/Artist can login with google
User/Artist can view a particular Tat

distinct functionality:
Tat has attributes [:name, :description, :color-range, :style, :artist_id, :schedule] 
User can create, edit and destroy Tat object
Artist can approve Tat request.
 

#pg_ctl -D /usr/local/var/postgres_dev -l logfile s


