class BaseStationSector < ActiveRecord::Base
  belongs_to :status
  belongs_to :base_station_unit
  has_many :client_links
end
