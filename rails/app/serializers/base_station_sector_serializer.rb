class BaseStationSectorSerializer < ActiveModel::Serializer
  attributes :id, :name, :sector, :base_station_unit, :status,
    :created_at, :updated_at
end
