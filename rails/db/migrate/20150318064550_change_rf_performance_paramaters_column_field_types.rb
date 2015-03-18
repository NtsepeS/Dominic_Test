class ChangeRfPerformanceParamatersColumnFieldTypes < ActiveRecord::Migration
  def change
    execute("ALTER TABLE rf_performance_parameters ALTER COLUMN uplink_rssi TYPE float USING (uplink_rssi::float)")
    execute("ALTER TABLE rf_performance_parameters ALTER COLUMN downlink_rssi TYPE float USING (downlink_rssi::float)")
    execute("ALTER TABLE rf_performance_parameters ALTER COLUMN uplink_cnr TYPE float USING (uplink_cnr::float)")
    execute("ALTER TABLE rf_performance_parameters ALTER COLUMN downlink_cnr TYPE float USING (downlink_cnr::float)")
    execute("ALTER TABLE rf_performance_parameters ALTER COLUMN tx_power TYPE float USING (tx_power::float)")
    execute("ALTER TABLE rf_performance_parameters ALTER COLUMN step_attenuator TYPE float USING (step_attenuator::float)")
  end
end
