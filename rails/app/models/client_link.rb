class ClientLink < ActiveRecord::Base
  has_paper_trail
  belongs_to :client
  belongs_to :status
  belongs_to :network_operator
  belongs_to :link_type
  belongs_to :base_station_sector
  belongs_to :antenna
end
