class RemoveBaseStationSectorRefFromClientLink < ActiveRecord::Migration
  def change
    remove_reference :client_links, :base_station_sector, index: true
  end
end
