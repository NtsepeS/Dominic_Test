module LinkEquipment
  extend ActiveSupport::Concern

  included do
    belongs_to :client_link
    delegate :base_station_sector, to: :client_link
    delegate :base_station_unit, to: :base_station_sector
    delegate :core_node, to: :base_station_unit
  end
end
