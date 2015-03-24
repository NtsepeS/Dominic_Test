class ContainerSerializer < ActiveModel::Serializer
  attributes :id, :containable_id, :containable_type, :parent_id, :lft, :rgt
end
