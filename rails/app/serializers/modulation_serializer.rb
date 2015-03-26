class ModulationSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :created_at, :updated_at, :downlink_min, :downlink_max, :uplink_min, :uplink_max

  has_one :operating_parameter
end
