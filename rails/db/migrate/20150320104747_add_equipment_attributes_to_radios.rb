class AddEquipmentAttributesToRadios < ActiveRecord::Migration
  def change
    add_column :radios, :serial_number, :string
    add_column :radios, :is_asset_tag, :string
    add_column :radios, :product_number, :string
    add_reference :radios, :client_link, index: true
  end
end
