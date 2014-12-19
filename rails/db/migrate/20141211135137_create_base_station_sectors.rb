class CreateBaseStationSectors < ActiveRecord::Migration
  def change
    create_table :base_station_sectors do |t|
      t.string :name
      t.references :status, index: true
      t.references :base_station_unit, index: true
      t.integer :sector

      t.timestamps
    end
  end
end
