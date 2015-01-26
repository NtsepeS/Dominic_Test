class BaseStationUnit < ActiveRecord::Base
  has_paper_trail
  belongs_to :core_node
  belongs_to :status
  has_many :base_station_sectors
end
