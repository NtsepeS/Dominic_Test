class AntennaSerializer < ActiveModel::Serializer
  attributes :id, :size, :item_code, :created_at, :updated_at

  has_one :location, :equipment
end
