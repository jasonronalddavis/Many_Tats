class AddStatustoTats < ActiveRecord::Migration[6.1]
  def change
    add_column :tats, :status, :string
  end
end
