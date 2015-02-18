class ChassisSerializer < ActiveModel::Serializer
  attributes :id

  has_one :container
end
