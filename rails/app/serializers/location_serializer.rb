class LocationSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at

  has_one :vicinity, :geometry
end
