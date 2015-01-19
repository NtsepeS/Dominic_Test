class CreateClientLinks < ActiveRecord::Migration
  def change
    create_table :client_links do |t|
      t.string :name
      t.string :branch
      t.string :circuit_number
      t.string :msad_number
      t.date :activation_date
      t.string :mac_address
      t.string :distance
      t.references :client, index: true
      t.references :status, index: true
      t.references :network_operator, index: true
      t.references :link_type, index: true
      t.references :base_station_sector, index: true
      t.references :antenna, index: true

      t.timestamps
    end
  end
end
