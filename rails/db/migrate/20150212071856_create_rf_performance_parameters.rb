class CreateRfPerformanceParameters < ActiveRecord::Migration
  def change
    create_table :rf_performance_parameters do |t|
      t.string :uplink_rssi
      t.string :downlink_rssi
      t.string :uplink_cni
      t.string :downlink_cni
      t.string :tx_power
      t.string :step_attenuator

      t.timestamps null: false
    end
  end
end
