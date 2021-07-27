class AddApproveToTats < ActiveRecord::Migration[6.1]
  def change
    add_column :tats, :approve, :integer
  end
end
