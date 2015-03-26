class LocationSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :created_at, :updated_at

  has_one :vicinity
  has_one :geometry
end
