class DropEquipmentContainers < ActiveRecord::Migration
  def change
    drop_table :equipment_containers
  end
end
