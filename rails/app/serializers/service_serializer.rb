class ServiceSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :created_at, :updated_at, :linetag, :line_speed, :vlan

  has_one :service_fragment
  has_many :ports, include: true
end
