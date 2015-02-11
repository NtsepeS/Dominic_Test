class CreateRadios < ActiveRecord::Migration
  def change
    create_table :radios do |t|
      t.string :name
      t.string :item_code
      t.boolean :icasa_sticker

      t.timestamps null: false
    end
  end
end
