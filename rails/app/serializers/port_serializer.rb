class PortSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :created_at, :updated_at, :vlan_type, :acceptable_frame_type, :default_vlan

  has_one :service
end
