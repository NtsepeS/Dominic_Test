class ControllerCardSerializer < ActiveModel::Serializer
  attributes :id

  has_one :equipment
end
