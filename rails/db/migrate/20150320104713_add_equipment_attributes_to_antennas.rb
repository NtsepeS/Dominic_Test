class AddEquipmentAttributesToAntennas < ActiveRecord::Migration
  def change
    add_column :antennas, :serial_number, :string
    add_column :antennas, :is_asset_tag, :string
    add_column :antennas, :product_number, :string
    add_reference :antennas, :client_link, index: true
  end
end
