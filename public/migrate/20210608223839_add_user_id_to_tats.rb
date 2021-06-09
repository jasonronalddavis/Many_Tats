class AddUserIdToTats < ActiveRecord::Migration[6.1]
  def change
    add_column :tats, :user_id, :integer
  end
end
