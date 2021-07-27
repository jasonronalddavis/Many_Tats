class RemoveUserIdFromArtist < ActiveRecord::Migration[6.1]
  def change
    remove_column :artists, :user_id, :integer
  end
end
