class ContainerSerializer < ActiveModel::Serializer
  attributes :id, :containable_id, :containable_type

  has_many :equipment
end
