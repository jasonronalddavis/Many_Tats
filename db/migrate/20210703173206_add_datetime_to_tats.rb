class AddDatetimeToTats < ActiveRecord::Migration[6.1]
  def change
    add_column :tats, :appointment_date, :datetime
  end
end
