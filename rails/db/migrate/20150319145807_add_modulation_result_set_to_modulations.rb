class AddModulationResultSetToModulations < ActiveRecord::Migration
  def change
    add_column :modulations, :modulation_result_set, :string
  end
end
