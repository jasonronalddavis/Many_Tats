class AddArtistIdToTats < ActiveRecord::Migration[6.1]
  def change
    add_column :tats, :artist_id, :integer
  end
end
