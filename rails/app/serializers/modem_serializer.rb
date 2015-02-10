class ModemSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_one :equipment
end
