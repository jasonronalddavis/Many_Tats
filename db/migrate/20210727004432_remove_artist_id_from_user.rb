class RemoveArtistIdFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :artist_id, :integer
  end
end
