class RfPerformanceParameterSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :uplink_rssi, :downlink_rssi, :uplink_cnr,
  :downlink_cnr, :tx_power, :step_attenuator, :rf_result_set, :radio_id

end
