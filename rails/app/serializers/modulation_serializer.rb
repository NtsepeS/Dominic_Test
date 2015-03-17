class ModulationSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :downlink_min, :downlink_max, :uplink_min, :uplink_max, :radio_id
end
