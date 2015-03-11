class RenameCniToCnrOnRfPerformanceParameters < ActiveRecord::Migration
  def change
    rename_column :rf_performance_parameters, :uplink_cni, :uplink_cnr
    rename_column :rf_performance_parameters, :downlink_cni, :downlink_cnr
  end
end
