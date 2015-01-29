class AntennaSerializer < ActiveModel::Serializer
  attributes :id, :size, :serial_number, :is_asset_tag, :created_at, :updated_at

  has_one :location
end
