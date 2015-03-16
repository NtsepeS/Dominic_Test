class RemoveBaseStationUnitRefFromBaseStationSector < ActiveRecord::Migration
  def change
    remove_reference :base_station_sectors, :base_station_unit, index: true
  end
end
