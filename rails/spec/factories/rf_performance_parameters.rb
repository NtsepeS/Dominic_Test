FactoryGirl.define do
  factory :rf_performance_parameter do
    uplink_rssi 1.5
    downlink_rssi 1.5
    uplink_cnr 1.5
    downlink_cnr 1.5
    tx_power 1.5
    step_attenuator 1.5
    rf_result_set "Predicted"
    radio_id 1
  end

end
