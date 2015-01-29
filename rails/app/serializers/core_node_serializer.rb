class CoreNodeSerializer < ActiveModel::Serializer
  attributes :id, :name, :city,
    :status, :created_at, :updated_at
end
