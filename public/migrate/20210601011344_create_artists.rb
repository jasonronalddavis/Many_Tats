class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :rating
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
