class BaseStationUnitSerializer < ActiveModel::Serializer
  attributes :id, :name, :core_node, :created_at, :updated_at

  has_one :status
  has_many :base_station_sectors
end
