class AntennaSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :size, :item_code, :created_at, :updated_at

  has_one :client_link
  has_one :location
end
