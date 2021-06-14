class CreateTats < ActiveRecord::Migration[6.1]
  def change
    create_table :tats do |t|
      t.string :style
      t.string :color_range
      t.float :price
      t.json :tat_size

      t.timestamps
    end
  end
end
