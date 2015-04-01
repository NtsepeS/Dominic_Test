class AddRfResultSetToRfPerformanceParameters < ActiveRecord::Migration
  def change
    add_column :rf_performance_parameters, :rf_result_set, :string
  end
end
