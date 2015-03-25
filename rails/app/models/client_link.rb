class ClientLink < ActiveRecord::Base
  include Equippable

  has_paper_trail ignore: [:created_at, :updated_at]

  equipped_with :antenna
  equipped_with :radio
  equipped_with :modem

  include Containable

  contained_in :base_station_sector
  delegate :base_station_unit, to: :base_station_sector
  delegate :core_node, to: :base_station_unit

  belongs_to :client
  belongs_to :status
  belongs_to :network_operator
  belongs_to :link_type

  has_many :service_fragment
  has_many :sub_group_picture_sets

end
