class BaseStationSector < ActiveRecord::Base
  has_paper_trail

  include Containable
  contained_in :base_station_unit
  contains :client_links
  delegate :core_node, to: :base_station_unit

  belongs_to :status
end
