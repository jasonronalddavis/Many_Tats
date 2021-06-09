class CreateTats < ActiveRecord::Migration[6.1]
  def change
    create_table :tats do |t|
      t.string :style
      t.integer :color_range
      t.float :price
      t.string :tat_size, :array

      t.timestamps
    end
  end
end
