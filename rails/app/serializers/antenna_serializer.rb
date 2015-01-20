class AntennaSerializer < ActiveModel::Serializer
  attributes :id, :size, :serial_number, :is_asset_tag, :latitude, :longitude,
    :created_at, :updated_at
end
