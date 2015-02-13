class RenameParamsFieldToParameterized < ActiveRecord::Migration
  def change
    remove_index :operating_parameters, name: "index_operating_parameters_on_params_type_and_params_id"

    rename_column :operating_parameters, :params_id, :parameterized_id
    rename_column :operating_parameters, :params_type, :parameterized_type

    add_index "operating_parameters", ["parameterized_id","parameterized_type"], :name => "index_operatingparameters_on_parameterized_type_and_id"
  end
end
