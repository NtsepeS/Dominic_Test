class CoreNodeSerializer < ActiveModel::Serializer
  attributes :id, :name, :city,
    :created_at, :updated_at

  has_one :location, :status
end
