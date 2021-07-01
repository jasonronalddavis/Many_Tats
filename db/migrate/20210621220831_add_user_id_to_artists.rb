class AddUserIdToArtists < ActiveRecord::Migration[6.1]
  def change
    add_column :artists, :user_id, :integer
  end
end
