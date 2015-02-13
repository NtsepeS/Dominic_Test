class OperatingParameterSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at

  has_one :location
end
