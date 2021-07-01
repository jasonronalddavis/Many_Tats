class AddArtistIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :artist_id, :integer
  end
end
