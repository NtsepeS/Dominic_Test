class CoreNodeSerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude, :city, 
    :status, :created_at, :updated_at
end
