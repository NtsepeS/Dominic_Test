class ClientLink < ActiveRecord::Base
  belongs_to :client
  belongs_to :status
  belongs_to :network_operator
  belongs_to :link_type
  belongs_to :base_station_sector
  belongs_to :antenna
end
