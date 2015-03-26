class BaseStationUnitSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name, :created_at, :updated_at

  has_one :status
  has_one :core_node
  has_many :base_station_sectors, include: true
end
