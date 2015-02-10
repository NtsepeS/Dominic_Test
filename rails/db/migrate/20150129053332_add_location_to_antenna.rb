class AddLocationToAntenna < ActiveRecord::Migration
  def change
    change_table :antennas do |t|
      t.references :location, index: true
      t.remove :longitude
      t.remove :latitude
    end
  end
end
