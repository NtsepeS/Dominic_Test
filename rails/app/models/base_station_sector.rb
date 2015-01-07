class BaseStationSector < ActiveRecord::Base
  has_paper_trail
  belongs_to :status
  belongs_to :base_station_unit
  has_many :client_links
end
