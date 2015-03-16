class RemoveCoreNodeRefFromBaseStationUnit < ActiveRecord::Migration
  def change
    remove_reference :base_station_units, :core_node
  end
end
