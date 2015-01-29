class GeometrySerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :altitude, :created_at, :updated_at
end
