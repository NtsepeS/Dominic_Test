class BaseStationSectorSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :name, :sector, :created_at, :updated_at

  has_one :status
  has_one :base_station_unit
  has_many :client_links
end
