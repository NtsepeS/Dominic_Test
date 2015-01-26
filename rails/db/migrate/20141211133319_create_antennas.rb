class CreateAntennas < ActiveRecord::Migration
  def change
    create_table :antennas do |t|
      t.string :size
      t.integer :serial_number
      t.integer :is_asset_tag
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
