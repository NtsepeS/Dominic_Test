class BaseStationSectorSerializer < ActiveModel::Serializer
  attributes :id, :name, :sector, :base_station_unit, :created_at, :updated_at

  has_one :status
  has_many :client_links
end
