class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :is_asset_tag
      t.string :serial_number
      t.string :model_number
      t.string :product_number
      t.references :equipped, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
