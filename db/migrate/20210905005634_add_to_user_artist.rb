class AddToUserArtist < ActiveRecord::Migration[6.1]
  def change
    add_column :user_artists, :name, :string 
    add_column :user_artists, :rating, :string
    add_column :user_artists, :email, :string
  end
end
