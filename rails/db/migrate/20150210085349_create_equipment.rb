class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :is_asset_tag
      t.references :equipable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
