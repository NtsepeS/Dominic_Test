class CreateBaseStationUnits < ActiveRecord::Migration
  def change
    create_table :base_station_units do |t|
      t.string :name
      t.references :status, index: true
      t.references :core_node

      t.timestamps
    end
  end
end
