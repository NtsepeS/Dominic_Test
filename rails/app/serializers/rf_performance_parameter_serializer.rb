class RfPerformanceParameterSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :uplink_rssi, :downlink_rssi, :uplink_cni, 
  :downlink_cni, :tx_power, :step_attenuator

  has_one :operating_parameter
end
