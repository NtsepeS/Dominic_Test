class CreateRfPerformanceParameters < ActiveRecord::Migration
  def change
    drop_table 'rf_performance_parameters' if ActiveRecord::Base.connection.table_exists? 'rf_performance_parameters'

    create_table :rf_performance_parameters do |t|
      t.float :uplink_rssi
      t.float :downlink_rssi
      t.float :uplink_cnr
      t.float :downlink_cnr
      t.float :tx_power
      t.float :step_attenuator

      t.timestamps null: false
    end
  end
end
