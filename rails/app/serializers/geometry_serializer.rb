class GeometrySerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :altitude
end
