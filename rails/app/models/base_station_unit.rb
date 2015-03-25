class BaseStationUnit < ActiveRecord::Base
  has_paper_trail

  include Containable
  contained_in :core_node
  contains :base_station_sectors

  belongs_to :status
end
