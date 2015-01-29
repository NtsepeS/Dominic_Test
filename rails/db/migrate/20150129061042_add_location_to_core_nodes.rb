class AddLocationToCoreNodes < ActiveRecord::Migration
  def change
    change_table :core_nodes do |t|
      t.references :location, index: true
      t.remove :longitude
      t.remove :latitude
    end
  end
end
