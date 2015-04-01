class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :linetag, :line_speed, :vlan, :service_fragment

  has_many :port
end
