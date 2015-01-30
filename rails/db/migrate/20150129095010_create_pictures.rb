class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :mechanism
      t.string :picture_data
      t.datetime :date_taken
      t.references :album, index: true

      t.timestamps null: false
    end
    add_foreign_key :pictures, :albums
  end
end
