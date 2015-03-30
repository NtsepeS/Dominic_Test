class PortSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :vlan_type, :acceptable_frame_type, :default_vlan
end
