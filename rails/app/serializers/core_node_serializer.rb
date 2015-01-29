class CoreNodeSerializer < ActiveModel::Serializer
  attributes :id, :name, :city,
    :status, :created_at, :updated_at

  has_one :location
end
