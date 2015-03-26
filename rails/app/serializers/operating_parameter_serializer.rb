class OperatingParameterSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :created_at, :updated_at

  has_one :location
end
