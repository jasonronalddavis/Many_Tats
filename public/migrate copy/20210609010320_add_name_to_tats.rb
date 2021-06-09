class AddNameToTats < ActiveRecord::Migration[6.1]
  def change
    add_column :tats, :name, :string
  end
end
