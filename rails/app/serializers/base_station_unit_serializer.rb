class BaseStationUnitSerializer < ActiveModel::Serializer
  attributes :id, :name, :core_node, :status, :created_at, :updated_at
end
