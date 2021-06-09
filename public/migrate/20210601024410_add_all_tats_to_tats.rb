class AddAllTatsToTats < ActiveRecord::Migration[6.1]
  def change
    add_column :tats, :all_tats, :json
  end
end
