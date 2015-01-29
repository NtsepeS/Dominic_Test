class LocationSerializer < ActiveModel::Serializer
  attributes :id

  has_one :vicinity, :geometry
end
