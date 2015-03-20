class AddEquipmentAttributesToModems < ActiveRecord::Migration
  def change
    add_column :modems, :serial_number, :string
    add_column :modems, :is_asset_tag, :string
    add_column :modems, :product_number, :string
    add_reference :modems, :client_link, index: true
  end
end
