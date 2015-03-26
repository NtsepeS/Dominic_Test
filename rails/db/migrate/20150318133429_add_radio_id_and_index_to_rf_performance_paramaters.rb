class AddRadioIdAndIndexToRfPerformanceParamaters < ActiveRecord::Migration
  def change
    add_column :rf_performance_parameters, :radio_id, :integer
    add_index :rf_performance_parameters, :radio_id
  end
end
