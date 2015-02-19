class CreateEquipmentContainers < ActiveRecord::Migration
  def change
    create_table :equipment_containers, id: false do |t|
      t.references :container, index: true
      t.references :equipment, index: true

      t.timestamps null: false
    end
    add_foreign_key :equipment_containers, :containers
    add_foreign_key :equipment_containers, :equipment
    add_index :equipment_containers, [:container_id, :equipment_id], unique: true
  end
end
