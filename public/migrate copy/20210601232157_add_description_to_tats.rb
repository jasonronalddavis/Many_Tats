class AddDescriptionToTats < ActiveRecord::Migration[6.1]
  def change
    add_column :tats, :descrpition, :string
  end
end
