class AddStatToTats < ActiveRecord::Migration[6.1]
  def change
    add_column :tats, :stat, :boolean
  end
end
