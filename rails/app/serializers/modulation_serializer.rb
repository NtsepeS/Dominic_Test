class ModulationSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :downlink_min, :downlink_max, :uplink_min,
  :uplink_max, :modulation_result_set, :radio_id
end
