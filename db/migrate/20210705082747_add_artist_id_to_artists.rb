class AddArtistIdToArtists < ActiveRecord::Migration[6.1]
  def change
    add_column :artists, :artist_id, :integer
  end
end
